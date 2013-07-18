class SubjectsController < ApplicationController
  def index
    @subjects = Subject.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @subjects }
    end
  end

  def manage
    @subjects = Subject.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @subjects }
    end
  end

  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @subject }
    end
  end

  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @subject }
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to(@subject, :notice => 'Subject was successfully created.') }
        format.json  { render :json => @subject, :status => :created, :location => @subject }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to(@subject, :notice => 'Subject was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to(subjects_url) }
      format.json  { head :ok }
    end
  end

  def report
    spreadsheet = Spreadsheeter.report_for_subjects
    send_data spreadsheet.string, :filename => I18n.t('fray.models.subject')+'s_'+I18n.t('fray.report')+".xls", :type =>  "application/vnd.ms-excel"
  end
end
