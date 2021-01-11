class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true

  has_many :posts

  def star(amount)
    # return star icons
    fill = %(<i class="fas fa-star"></i>)
    line = %(<i class="far fa-star"></i>)
    i = amount.count
    case i
    when 0
      stars = line, line, line
    when 1
      stars = fill, line, line
    when 2
      stars = fill, fill, line
    else
      stars = fill, fill, fill
    end
    return stars.join
  end
end
