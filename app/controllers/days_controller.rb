class DaysController < ApplicationController
  def new
    @day = Day.find_by(date: Date.today) || Day.new(date: Date.today)
    @post = @day.posts.build
  end

  def create
    @day = Day.find_by(date: Date.today) || Day.new(date: Date.today)
    @post = @day.posts.build
    @post.day_id = @day.id
    @post.content = params[:content]
    @day.save
    redirect_to "/posts/index"
  end
end
