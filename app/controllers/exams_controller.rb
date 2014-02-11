class ExamsController < ApplicationController
  def index 

    if params[:subject_id].nil?
      @exams = Exam.all
    else
      @exams = Subject.find(params[:subject_id]).exams.paginate page:
        params[:page], order: "created_at DESC", per_page: 5
    end

    respond_to do |format|
      format.html
      format.json {render json: @exams}
    end
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save 
      flash.now[:success] = "Exam form crated successfully"
      render 'new'
    else
      render 'new'
    end
  end

  def edit
    @exam = Exam.find params[:id]
  end

  def update
    @exam = Exam.find params[:id]
    if @exam.update_attributes exam_params
      flash.now[:success] = "Exam form updated successfully"
      redirect_to @exam.subject
    else
      render 'edit'
    end
  end

  def destroy
    @exam = Exam.find params[:id]
    @subject = @exam.subject
    if !@exam.destroy
      flash.now[:failure] = "Exam form destroy failed"
    end
    redirect_to @subject
  end

  private
  def exam_params
    params.require(:exam).permit(:subject_id, :name, :duration, 
      exam_details_attributes:[:id, :question_type, :_destroy])
  end
end
