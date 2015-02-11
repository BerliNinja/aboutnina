class PostsController < ApplicationController
  before_action :authenticate_user!
  helper_method :collection, :resource

def index
end

def new
  @post = Post.new
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
  @post.save!
end

def update
  @post = Post.find(params[:id])
  @post.update!(permitted_params)
  render :show
end

def create
  @post = Post.new(permitted_params)
  if @post.save
    redirect_to @post, notice: 'ok!'
  else
    render :new
  end
end

protected

def permitted_params
  params.require(:post).permit(:title, :description, :timestamp, :answer)
end

# def post_creation_params
#   permitted_params.merge({
#     user_id: current_user.id
#   })
# end

def collection
  @post ||= Post.all
end
end