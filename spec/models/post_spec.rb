require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validattion" do

    it "is valid with a content, a user_id and a day_id" do
      post = create(:post)
      expect(post).to be_valid
    end

    it "is invalid without a content" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      post = build(:post, user_id: nil)
      post.valid?
      expect(post.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a day_id" do
      post = build(:post, day_id: nil)
      post.valid?
      expect(post.errors[:day_id]).to include("can't be blank")
    end
    
  end
end
