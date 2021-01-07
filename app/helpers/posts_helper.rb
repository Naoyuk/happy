module PostsHelper

  def my_posts(day_id)
    Post.where(day_id: day_id, user_id: current_user.id).order(created_at: :desc)
  end

end
