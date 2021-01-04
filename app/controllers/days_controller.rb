class DaysController < ApplicationController
  def new
    @day = Day.find_by(date: Date.today) || Day.new(date: Date.today)
    @post = @day.posts.build
  end

  def create
    @day = Day.find_by(date: Date.today) || Day.create(date: Date.today)
    @post = @day.posts.build
    @post.user_id = current_user.id
    @post.content = params[:content]
    if @day.save
      redirect_to "/posts/index"
    else
      @errors = @day.errors
      render "new"
    end
  end
end
