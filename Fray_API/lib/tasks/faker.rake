namespace :db do
  namespace :development do
    desc "Create user records in the development database."

    task :faker => :environment do
      require 'faker'

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
            :group_id => Group.all.shuffle.first.object_id
        )

        s.save!

      end

    end
  end
end
