class PostsController < ApplicationController
  def index
    @days = Day.eager_load(:posts).where(posts: {user_id: current_user.id}).order(date: :desc)
    #@posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], day_id: params[:day_id])
    if @post.save
      redirect_to "/posts/index"
    else
      new
    end
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
      edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts/index"
  end
end
