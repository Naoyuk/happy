require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a content, a user_id and a day_id" do
    user = User.create(name: "tester", email: "tester@example.com", password: "Test1234")
    day = Day.create(date: Date.today)
    post = Post.new(
      content: "today's happy",
      user_id: user.id,
      day_id: day.id
    )
    expect(post).to be_valid
  end

  it "is invalid without a content" do
    user = User.create(name: "tester", email: "tester@example.com", password: "Test1234")
    day = Day.create(date: Date.today)
    post = Post.new( content: nil )
    post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
    post = Post.new( user_id: nil )
    post.valid?
    expect(post.errors[:user_id]).to include("can't be blank")
  end

  it "is invalid without a day_id" do
    post = Post.new( day_id: nil )
    post.valid?
    expect(post.errors[:day_id]).to include("can't be blank")
  end
end
