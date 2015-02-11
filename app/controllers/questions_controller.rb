class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  helper_method :collection, :resource

def index
  @questions = Question.order("updated_at ASC")
end

def new
  @question = Question.new
end

def show
  @question = Question.find(params[:id])
end

def edit
  @question = Question.find(params[:id])
  @question.save!
end

def update
  @question = Question.find(params[:id])
  @question.update!(permitted_params)
  render :show
end

def create
  @question = Question.new(permitted_params)
  if @question.save
    redirect_to @question, notice: 'ok!'
  else
    render :new
  end
end

protected

def permitted_params
  params.require(:question).permit(:title, :description, :timestamp, :answer)
end

# def question_creation_params
#   permitted_params.merge({
#     user_id: current_user.id
#   })
# end

def collection
  @question ||= Question.all
end

end