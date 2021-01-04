require 'rails_helper'

RSpec.describe Day, type: :model do
  
  it "is valid with a date" do
    day = create(:day)
    expect(day).to be_valid
  end
  
  it "is invalid without a date" do
    day = Day.new(
      date: nil
    )
    day.valid?
    expect(day.errors[:date]).to include("can't be blank")
  end

  it "is invalid with a duplicate date" do
    create(:day, date: Date.today)
    day = build(:day, date: Date.today)
    day.valid?
    expect(day.errors[:date]).to include("has already been taken")
  end
  
end
