class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find params[:id]
    @questions = @subject.questions.paginate page: params[:page],
      order: "created_at DESC", per_page: 5
    @exams = @subject.exams.paginate page: params[:page],
      order: "created_at DESC", per_page: 5
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new name: params[:subject][:name]
    if @subject.save
      flash[:success] = "Subject created successfully."
      redirect_to subjects_path
    else
      flash.now[:error] = "Error!!!"
      render 'new'
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes name: params[:subject][:name]
      flash[:success] = "Subject successfully updated!"
      redirect_to @subject
    else
      flash.now[:error] = "Error!!!"
      render "edit"
    end
  end
end
