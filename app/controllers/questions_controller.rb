class QuestionsController < ApplicationController

  def index
    @questions = Question.paginate page: params[:page], order: "created_at DESC"
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create question_params
    if @question.save!
      flash[:success] = "Question created successfully"
      redirect_to questions_path
    else
      render 'new'
    end
  end
  
  private
  def question_params
  	:answer = params[:a] + "[|]" + params[:b] + "[|]" + params[:c] + "[|]" + params[:d]
    params.require(:user).permit(:subject_id, :type, :content, :answer)
  end
end
