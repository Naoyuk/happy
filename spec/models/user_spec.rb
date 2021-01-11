require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is valid with a name, an email and an encrypted_password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without an password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  
  it "is invalid with a duplicate name" do
    create(:user, name: "tester1")
    user = build(:user, name: "tester1")
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end

  it "is invalid with a duplicate email address" do
    create(:user, email: "tester@example.com")
    user = build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
