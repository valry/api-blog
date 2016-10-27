require "rails_helper"

RSpec.describe "ApiContollerRequestTests", :type => :request do
  before {
      @headers = {"Content-Type" => "application/json",
                  "Authorization" => "#{api_token}"}
      @params = {
            "title":"title for post",
            "body":"body for post"
          }
    }

  let(:api_token) {
    u = User.create(nickname: "Andy", email: "Andy@mailndy.ru", password: "12345678");
    u.api_key.key
  }

  it "successfully create post" do
    post "/api/v1/posts.json", @params.to_json, @headers
    expect({"title"=>"title for post", "body"=>"body for post",
            "author_nickname"=>"Andy"}).to eq(JSON.parse(response.body).except! "published_at","id")
  end


  it "successfully find post by id" do
    post "/api/v1/posts.json", @params.to_json, @headers
    post_id = JSON.parse(response.body)["id"]

    get "/api/v1/posts/#{post_id}", nil, @headers
    expect(post_id).to eq(JSON.parse(response.body)["id"])
  end

  it "succesfully get by page" do
    post "/api/v1/posts.json", @params.to_json, @headers
    params = {"page":"1","per_page":"1"}
    get "/api/v1/posts/", params, @headers
    expect(1).to eq(response.header["total_pages"])
    expect(1).to eq(response.header["total_count"])
  end

end
