class GradesController < ApplicationController
  def index
    @grades = Grade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @grades }
    end
  end

  def manage
    @groups = Group.all
    @grades = Grade.all

    begin
      @group = Group.find(params[:id])
      @lectures = @group.lectures
    rescue

    end

    begin

      @lecture = Lecture.find(params[:lecture_id])

      @students = []
      Student.all.each do |s|
        s.lectures.each do |l|
          if(l.id == @lecture.id)
            @students.push s
          end
        end
      end

    rescue

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @grades }
    end
  end

  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @grade }
    end
  end

  def new
    @grade = Grade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @grade }
    end
  end

  def new_with_student
    @grade = Grade.new
    @student = Student.find(params[:student_id])
    @lecture = Lecture.find(params[:lecture_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @grade }
    end
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def close_grade
    @grade = Grade.new(params[:grade])
    params.each do |x,v|
      puts x+'-'+v
    end

    uri = '/grades/manage/'+@grade.lecture.group.id.to_s+'/'+@grade.lecture.id.to_s

    if @grade.value and @grade.value + @grade.student.get_accumulated_score(@grade.lecture.id) > 100

      redirect_to(uri, :flash => {:error => "No se puede pasar de 100"})

    else

      respond_to do |format|
        if @grade.save
          format.html { redirect_to(uri, :notice => 'Grade was successfully created.') }
          format.json  { render :json => @grade, :status => :created, :location => @grade }
        else
          format.html { render :action => "new" }
          format.json  { render :json => @grade.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def create
    @grade = Grade.new(params[:grade])
    params.each do |x|
      puts x
    end

    uri = '/grades/manage/'+@grade.lecture.group.id.to_s+'/'+@grade.lecture.id.to_s

    if @grade.value and @grade.value + @grade.student.get_accumulated_score(@grade.lecture.id) > 100

      redirect_to(uri, :flash => {:error => "No se puede pasar de 100"})

    else

      respond_to do |format|
        if @grade.save
          format.html { redirect_to(uri, :notice => 'Grade was successfully created.') }
          format.json  { render :json => @grade, :status => :created, :location => @grade }
        else
          format.html { render :action => "new" }
          format.json  { render :json => @grade.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        format.html { redirect_to(@grade, :notice => 'Grade was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @grade.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to(grades_url) }
      format.json  { head :ok }
    end
  end
end
