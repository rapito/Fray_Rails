class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @schedules }
    end
  end

  def manage
    @schedules = Schedule.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @schedules }
    end
  end

  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @schedule }
    end
  end

  def new
    @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @schedule }
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to(@schedule, :notice => 'Schedule was successfully created.') }
        format.json  { render :json => @schedule, :status => :created, :location => @schedule }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to(@schedule, :notice => 'Schedule was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to(schedules_url) }
      format.json  { head :ok }
    end
  end
end
