class Day < ApplicationRecord
    has_many :posts

    validates :date, presence: true, uniqueness: true
end
