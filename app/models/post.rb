class Post < ApplicationRecord
    belongs_to :day
    belongs_to :user

    validates :content, :user_id, :day_id, presence: :true
end
