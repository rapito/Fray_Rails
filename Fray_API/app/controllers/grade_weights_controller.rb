class GradeWeightsController < ApplicationController
  def index
    @grade_weights = GradeWeight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @grade_weights }
    end
  end

  def new
    @grade_weight = GradeWeight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grade_weight }
    end
  end

  def create
    @grade_weight = GradeWeight.new(params[:grade_weight])

    respond_to do |format|
      if @grade_weight.save
        format.html { redirect_to(@grade_weight, :notice => 'Grade weight was successfully created.') }
        format.xml  { render :xml => @grade_weight, :status => :created, :location => @grade_weight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grade_weight.errors, :status => :unprocessable_entity }
      end
    end
  end

  def assign_weight
    grades = []
    sep = 'weight_'

    @lecture = Lecture.find(params[:lecture_id])
    params.each do |k,v|
      if(k.start_with? sep)
        gg = Grade.find(k.split(sep).last)
        gg.value = v.to_f*10000
        grades.push gg
      end
    end

    grades.each do |g|
      weight = GradeWeight.where(:lecture_id => @lecture.id, :comment => g.comment).first
      if not weight
        weight = GradeWeight.new(:lecture_id => @lecture.id, :weight=> g.value, :comment => g.comment)
        @lecture.weights << weight
      else
        weight.weight = g.value
      end

      @lecture.save!
      weight.save!
    end

    begin
      redirect_to('/grades/overall_lecture_weight/'+params[:lecture_id].to_s, :notice => 'Grade weight was successfully created.')
    rescue
      redirect_to('/grades/overall_lecture_weight/'+params[:lecture_id].to_s, :alert => 'Grade weight was successfully created.')
    end

  end

  def close_grade
    @student = Student.find(params[:student_id])
    @lecture = Lecture.find(params[:lecture_id])
    @grades = Grade.where(:student_id => params[:student_id],:lecture_id => params[:lecture_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grade_weight }
    end
  end

  def destroy
    @grade_weight = GradeWeight.find(params[:id])
    @grade_weight.destroy

    respond_to do |format|
      format.html { redirect_to('/grades/manage/'+@grade_weight.grade.lecture.group.id.to_s+'/'+@grade_weight.grade.lecture.id.to_s) }
      format.xml  { head :ok }
    end
  end
end
