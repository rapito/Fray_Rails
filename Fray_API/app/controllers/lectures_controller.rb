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
    spreadsheet = Spreadsheeter.report_for_lectures

    send_data spreadsheet.string, :filename => I18n.t('fray.models.lecture')+'_'+I18n.t('fray.report')+".xls", :type =>  "application/vnd.ms-excel"
  end

end
