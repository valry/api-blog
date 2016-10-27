require "rails_helper"

RSpec.describe ApiKey, :type => :model do

  it "check for key created" do
    user = User.create(nickname: "Name", email: "Email", password: "Password")
    expect(false).to eq(user.api_key.key.nil?)
  end
end

