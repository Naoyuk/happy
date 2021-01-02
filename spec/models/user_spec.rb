require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, an email and an encrypted_password" do
    user = User.new(
      name: 'tester',
      email: 'tester@example.com',
      password: 'Test1234',
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without an password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  
  it "is invalid with a duplicate name" do
    User.create(
      name: 'tester1',
      email: 'tester1@example.com',
      password: 'Test1234',
    )
    user = User.new(
      name: 'tester1',
      email: 'tester2@example.com',
      password: 'Test1234',
    )
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: 'tester1',
      email: 'tester1@example.com',
      password: 'Test1234',
    )
    user = User.new(
      name: 'tester2',
      email: 'tester1@example.com',
      password: 'Test1234',
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
end
