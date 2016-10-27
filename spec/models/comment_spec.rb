require "rails_helper"


RSpec.describe Comment, :type => :model do

  before {
    @user = User.create(nickname:"name", password:"a12ads2113@@", email: "222@222.rb")
    @post = @user.posts.create(body:'body', title:'title', published_at:'22.12.2010')
  }

  it "create comment check published" do
    @user.comments.create(body: 'comment_body', post_id: @post.id)
    expect(false).to eq(Comment.first.published_at.nil?)
  end
end

