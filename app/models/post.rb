class Post < ApplicationRecord
  validates :content, :user_id, :day_id, presence: :true

  belongs_to :day
  belongs_to :owner, class_name: :User, foreign_key: :user_id
end
