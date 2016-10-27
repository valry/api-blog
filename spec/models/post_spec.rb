require "rails_helper"

RSpec.describe Post, :type => :model do

  let(:user){User.create(nickname: "Andy", password: "#sad@!#fs", email: "Andy@amail.su")}

  it "check Post create" do
    user.posts.create(title: 'Post title', body: "Post body", published_at: "22.12.2012")
    expect("Post body").to eq(Post.last.body)
  end

  it "check Post newest" do
    user.posts.create(title: 'Title', body: 'Body', published_at: "25.12.2011")
    expect("Body").to eq(Post.newest.first.body)
  end

  it "chec Post date_range" do
    3.times do |i|
      user.posts.create(title: 'Title', body: 'Body', published_at: "25.12.201#{i}")
    end
    expect(1).to eq(Post.date_range("10.10.2012","10.10.2016").count)
  end

end
