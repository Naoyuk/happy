class DaysController < ApplicationController
  before_action :set_time_zone

  def new
    # @day = Day.find_by(date: Date.today) || Day.new(date: Date.today)
    @day = Day.find_by(date: Time.now.in_time_zone.to_date) || Day.new(date: Time.now.in_time_zone.to_date)
    @post = @day.posts.build
  end

  def create
    # @day = Day.find_by(date: Date.today) || Day.create(date: Date.today)
    @day = Day.find_by(date: Time.now.in_time_zone.to_date) || Day.create(date: Time.now.in_time_zone.to_date)
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
