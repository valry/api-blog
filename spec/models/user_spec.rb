require "rails_helper"

RSpec.describe User, :type => :model do

  it "check User create" do
    User.create(nickname: "Andy", password: "#sad@!#fs", email: "Andy@amail.su")
    expect("Andy").to eq(User.last.nickname)
  end


end
