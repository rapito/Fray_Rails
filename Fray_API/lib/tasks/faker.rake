namespace :db do
  namespace :development do
    desc "Create user records in the development database."

    task :faker => :environment do
      require 'faker'

      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke

      def randomDate(params={})
        years_back = params[:year_range] || 5
        latest_year  = params [:year_latest] || 0
        year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
        month = (rand * 12).ceil
        day = (rand * 31).ceil
        series = [date = Time.local(year, month, day)]
        if params[:series]
          params[:series].each do |some_time_after|
            series << series.last + (rand * some_time_after).ceil
          end
          return series
        end
        date
      end

      @studies = ['Mathematics','French','Spanish','Literature','Biologist','Chemistry']
      @stages = ['1st','2nd','3rd','4th','5th','6th','7th','8th','9th','10th']
      @groups = {:GAMMA=>'A',:BETA=>'B',:ALPHA=>'C'}
      @subjects = ['Mathematics','Biology','Physics','Literature','English','Spanish','Sociology']
      @days = ['Monday','Tuesday','Wednesday','Thursday','Friday']

      puts 'Creating Academic Periods...'
      p = Period.create(
         :init_date => Date.new(2013,2,5),
         :end_date => Date.new(2013,7,20),
         :kind => 'SECOND SEMESTER'
      )
      p.save!
      puts 'Finished with Academic Periods!'

      puts 'Creating Stages...'
      @stages.each do |st|
        s = Stage.create(:name => st)
        s.save!
      end
      puts 'Finished with stages!'

      puts 'Creating Teachers...'
      20.times do

        s = Teacher.create(
            :kind => 'Teacher',
            :studies => @studies.shuffle.first,
            :salary => (rand*100000).to_i,
            :first_name => Faker::Name.first_name,
            :middle_name => Faker::Name.first_name,
            :first_last_name => Faker::Name.last_name,
            :second_last_name => Faker::Name.last_name,
            :identification_card => Faker::Lorem.words(1).to_s.capitalize,
            :phone_1 => (rand*10000000000).to_i,
            :phone_2 => (rand*10000000000).to_i,
            :address_1 => Faker::Address.street_name(),
            :address_2 => Faker::Address.street_name(),
            :nationality => 'Dominican',
            :registration_date => randomDate(:year_range => 60, :year_latest => 22),
            :created_at => randomDate(:year_range => 4, :year_latest => 0),
            :active => true,
            :email => Faker::Internet.email,
            :password => "adminadmin",
            :password_confirmation => "adminadmin",
        )

        s.save!

      end
      puts 'Finished with teachers!'

      puts 'Creating Groups...'
      @groups.each do |x,v|

        g = Group.create(
            :name => x,
            :suffix => v,
        )
        g.period = p
        g.teacher = Teacher.all.shuffle.first
        g.stage = Stage.all.shuffle.first
        g.save!

      end
      puts 'Finished with Groups!'

      puts 'Creating Subjects...'
      20.times do

        sub = Subject.create(
            :name => @subjects.shuffle.first + ' ' + rand(1..5).to_s
        )
        sub.stage = Stage.all.shuffle.first
        sub.save!

      end
      puts 'Finished with Subjects!'

      puts 'Creating Schedules...'
      (1..4).each do |x|

        sch = Schedule.create(
            :start_time => Time.new(2013,1,1,6+x,1,0),
            :end_time => Time.new(2013,1,1,7+x,0,0),
            :day => @days.shuffle.first
        )
        sch.save!

      end
      puts 'Finished with Schedules!'

      puts 'Creating Lectures...'
      Group.all.each do |x|
        Schedule.all.each do |sch|
          lecture = Lecture.create
          lecture.group = x
          lecture.schedule = sch
          lecture.subject = Subject.all.shuffle.first
          lecture.teacher = Teacher.all.shuffle.first
          x.lectures << lecture
          x.save
          lecture.save
        end
      end
      puts 'Finished with Lectures!'


      puts 'Creating Students...'
      100.times do

        s = Student.create(
            :kind => 'Student',
            :enrollment_code => Faker::Lorem.words(1).to_s.capitalize,
            :enrollment_outer_code => Faker::Lorem.words(1).to_s.capitalize,
            :first_name => Faker::Name.first_name,
            :middle_name => Faker::Name.first_name,
            :first_last_name => Faker::Name.last_name,
            :second_last_name => Faker::Name.last_name,
            :identification_card => Faker::Lorem.words(1).to_s.capitalize,
            :phone_1 => (rand*10000000).to_i,
            :phone_2 => (rand*10000000).to_i,
            :address_1 => Faker::Address.street_name(),
            :address_2 => Faker::Address.street_name(),
            :nationality => 'Dominican',
            :registration_date => randomDate(:year_range => 60, :year_latest => 22),
            :created_at => randomDate(:year_range => 4, :year_latest => 0),
            :active => true,
            :email => Faker::Internet.email,
            :password => "greatpasswordhuh",
            :password_confirmation => "greatpasswordhuh",
            :group_id => Group.all.shuffle.first.id
        )
        s.assign_to_group
        s.save!

      end
      puts 'Finished with Students!'

      puts 'Assigning Grades!'
      Student.all.each do |s|
        s.lectures.each do |l|
          I18n.t('fray.lecture_assignments').each do |x|
            grade = Grade.new
            grade.value = rand(20..25)
            grade.comment = x
            grade.student = s
            grade.lecture = l
            grade.save!
          end
        end
      end
      puts 'Finished Assigning Grades'

      puts 'Creating Admin'
      s = Teacher.create(
          :kind => 'Teacher',
          :studies => @studies.shuffle.first,
          :salary => (rand*100000).to_i,
          :first_name => Faker::Name.first_name,
          :middle_name => Faker::Name.first_name,
          :first_last_name => Faker::Name.last_name,
          :second_last_name => Faker::Name.last_name,
          :identification_card => Faker::Lorem.words(1).to_s.capitalize,
          :phone_1 => (rand*10000000000).to_i,
          :phone_2 => (rand*10000000000).to_i,
          :address_1 => Faker::Address.street_name(),
          :address_2 => Faker::Address.street_name(),
          :nationality => 'Dominican',
          :registration_date => randomDate(:year_range => 60, :year_latest => 22),
          :created_at => randomDate(:year_range => 4, :year_latest => 0),
          :active => true,
          :email => 'admin@fray.com',
          :password => "adminadmin",
          :password_confirmation => "adminadmin",
      )

      s.save!

      puts 'Created ' + s.first_name

    end
  end
end
