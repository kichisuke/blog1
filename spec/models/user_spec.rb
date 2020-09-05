require 'rails_helper'

RSpec.describe User, type: :model do

  it "is unvalid with username, password" do
    user = User.new(
      username: "hoge",
      password: "hogehoge"
    )
    expect(user).to be_valid
  end

  it "is unvalid if password is blank" do
    user = User.new(
      username: "hoge"
    )
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is unvalid if password is under 8 characters" do
    user = User.new(
      username: "hoge",
      password: "hoge"
    )
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end
