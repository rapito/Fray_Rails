  class GroupsController < ApplicationController

  def index
    @groups = Group.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @groups }
    end
  end

  def assign_student
    @student = Student.find(params[:student][:id])
    @group = Group.find(params[:student][:group_id])

    flash = {:success => (I18n.t('fray.models.student')+' '+I18n.t('fray.buttons.process.assign_success'))}

    begin
      @student.lectures << @group.lectures
    rescue
      flash = {:error => (I18n.t('fray.models.student')+' '+I18n.t('fray.buttons.process.assign_failed'))}
    end


    redirect_to ('/groups/manage'), :flash => flash

  end

  def manage

    @groups = Group.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # manage.html.erb
      format.json  { render :json => @groups }
    end
  end

  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @group }
    end
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @group }
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
        format.json  { render :json => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.json  { head :ok }
    end
  end

  def report
    spreadsheet = Spreadsheeter.report_for_groups

    send_data spreadsheet.string, :filename => I18n.t('fray.models.group')+'s_'+I18n.t('fray.report')+".xls", :type =>  "application/vnd.ms-excel"
  end

end
