class QuestionsController < ApplicationController
  before_action :authenticate_user!

def new
  @question = Question.new
end

def show
  @question = Question.find(params[:id])
end

def update
end

def edit
end

def create
  @question = Question.new(permitted_params)
  if @question.save
    redirect_to @question, notice: 'ok!'
  else
    render :new
  end
end

private

def permitted_params
  params.require(:question).permit(:title, :description, :timestamp)
end

def collection
  @question ||= Question.all
end

  helper_method :collection, :resource
end