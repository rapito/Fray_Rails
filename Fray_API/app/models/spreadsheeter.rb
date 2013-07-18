class Spreadsheeter

  def self.report_for_groups

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = I18n.t('fray.models.group')

    columns = [I18n.t('fray.name'),I18n.t('fray.suffix'),I18n.t('fray.models.period'),I18n.t('fray.models.teacher'),I18n.t('fray.models.stage'),I18n.t('fray.models.student')+'s']

    sheet1.row(0).concat [I18n.t('fray.models.group'),I18n.t('fray.report')]
    sheet1.row(1).concat columns

    row = 1
    Group.all.each do |l|
      row = row.next
      sheet1.row(row).push(l.name,l.suffix,l.period.humanize,l.teacher.first_name+' '+l.teacher.first_last_name,l.stage.name,l.students.size)
    end

    sheet1.row(0).height = 18
    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    columns.size.times do |x| sheet1.row(1).set_format(x, bold) end

    spreadsheet = StringIO.new
    book.write spreadsheet
    spreadsheet

  end


  def self.report_for_subjects

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = I18n.t('fray.models.subject')

    columns = [I18n.t('fray.name'),I18n.t('fray.models.stage')]

    sheet1.row(0).concat [I18n.t('fray.models.group'),I18n.t('fray.report')]
    sheet1.row(1).concat columns

    row = 1
    Subject.all.each do |l|
      row = row.next
      sheet1.row(row).push(l.name,l.stage.name)
    end

    sheet1.row(0).height = 18
    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    columns.size.times do |x| sheet1.row(1).set_format(x, bold) end

    spreadsheet = StringIO.new
    book.write spreadsheet
    spreadsheet

  end

  def self.report_for_students

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = I18n.t('fray.models.student')

    columns = [I18n.t('fray.users.enrollment_code'),I18n.t('fray.name'),I18n.t('fray.users.phone'),I18n.t('fray.users.address'),I18n.t('fray.users.nationality'),I18n.t('fray.users.registration_date'),I18n.t('fray.users.active')]

    sheet1.row(0).concat [I18n.t('fray.models.student'),I18n.t('fray.report')]
    sheet1.row(1).concat columns

    row = 1
    Student.all.each do |l|
      row = row.next
      sheet1.row(row).push(l.enrollment_code,l.first_name+' '+l.first_last_name,l.phone_1,l.address_1,l.nationality,l.registration_date,l.active)
    end

    sheet1.row(0).height = 18
    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    columns.size.times do |x| sheet1.row(1).set_format(x, bold) end

    spreadsheet = StringIO.new
    book.write spreadsheet
    spreadsheet

  end

  def self.report_for_teachers

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = I18n.t('fray.models.teacher')

    columns = [I18n.t('fray.users.studies'),I18n.t('fray.users.salary'),I18n.t('fray.users.name'),I18n.t('fray.users.identification_card'),
               I18n.t('fray.users.phone'),I18n.t('fray.users.address'),I18n.t('fray.users.nationality')]

    sheet1.row(0).concat [I18n.t('fray.models.teacher'),I18n.t('fray.report')]
    sheet1.row(1).concat columns

    row = 1
    Teacher.all.each do |l|
      row = row.next
      sheet1.row(row).push(l.studies,l.salary,l.first_name+' '+l.first_last_name,l.identification_card,l.phone_1,l.address_1,l.nationality)
    end

    sheet1.row(0).height = 18
    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    columns.size.times do |x| sheet1.row(1).set_format(x, bold) end

    spreadsheet = StringIO.new
    book.write spreadsheet
    spreadsheet

  end

  def self.report_for_lectures
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = I18n.t('fray.models.lecture')

    sheet1.row(0).concat [I18n.t('fray.models.lecture'),I18n.t('fray.report')]
    sheet1.row(1).concat [I18n.t('fray.models.group'),I18n.t('fray.models.schedule'),I18n.t('fray.models.subject'),I18n.t('fray.models.teacher')]

    row = 1
    Lecture.all.each do |l|
      row = row.next
      sheet1.row(row).push(l.group.name,l.schedule.humanize,l.subject.name,l.teacher.first_name+' '+l.teacher.first_last_name)
    end

    sheet1.row(0).height = 18
    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(1).set_format(x, bold) end

    spreadsheet = StringIO.new
    book.write spreadsheet
    spreadsheet

  end

end