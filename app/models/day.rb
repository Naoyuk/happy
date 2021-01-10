class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true

  has_many :posts

  def star(amount)
    # return star icons
    fill = "<i class=\"fas fa-star\"></i>"
    line = "<i class=\"far fa-star\"></i>"
    i = amount.count
    if i >= 3
      stars = fill, fill, fill
    elsif i == 2
      stars = fill, fill, line
    elsif i == 1
      stars = fill, line, line
    else
      stars = line, line, line
    end
    return stars.join
  end
end
