class PostsController < ApplicationController
  before_action :login_user?
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_owner?, except: [:index, :new, :create]

  def index
    @days = Day.eager_load(:posts).where(posts: {user_id: current_user.id}).order(date: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(content: params[:content], day_id: params[:day_id], user_id: current_user.id)
    # if @post.save
    #   redirect_to "/posts/index"
    # else
    #   render "new"
    # end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.content = params[:content]
    if @post.save
      redirect_to '/posts/index'
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts/index"
  end

  protected

  def set_post
    @post = Post.find(params[:id])
  end

  def post_owner?
    unless @post.owner == current_user
      redirect_to posts_index_path, alert: "You don't have access to that post."
    end
  end

  private

  def login_user?
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
