class LecturesController < ApplicationController

  def index
    @lectures = Lecture.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @lectures }
    end
  end

  def manage
    @lectures = Lecture.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @lectures }
    end
  end

  def show
    @lecture = Lecture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @lecture }
    end
  end

  def new
    @lecture = Lecture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @lecture }
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def create
    @lecture = Lecture.new(params[:lecture])

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to(@lecture, :notice => 'Lecture was successfully created.') }
        format.json  { render :json => @lecture, :status => :created, :location => @lecture }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @lecture.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @lecture = Lecture.find(params[:id])

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
        format.html { redirect_to(@lecture, :notice => 'Lecture was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @lecture.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to(lectures_url) }
      format.json  { head :ok }
    end
  end

  def report
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = I18n.t('fray.models.lecture')

    #Now, add data to the Worksheet, using either Worksheet#[]=,
    # Worksheet#update_row, or work directly on Row using any of
    # the Array-Methods that modify an Array in place:

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

    #And finally, write the Excel File:
    spreadsheet = StringIO.new
    book.write spreadsheet
    send_data spreadsheet.string, :filename => I18n.t('fray.models.lecture')+'_'+I18n.t('fray.report')+".xls", :type =>  "application/vnd.ms-excel"
  end

end
