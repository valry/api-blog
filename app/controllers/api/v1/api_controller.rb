class Api::V1::ApiController < ActionController::Base
  require 'will_paginate/array'
  #protect_from_forgery with: :null_session
  #skip_before_filter  :verify_authenticity_token
  before_action  :check_errors, except: [:get_post_by_id, :get_posts_by_page]
  before_action  :check_auth,   only: [:get_post_by_id, :get_posts_by_page]
  before_action  :find_user

  def create_post
    unless permit_params[:published_at].try(:to_date).blank?
      @published = permit_params[:published_at].to_date.strftime('%d.%m.%Y %H:%m').to_date
    else
      @published = Time.now.strftime('%d.%m.%Y %H:%m').to_date
    end

    new_post = @user.posts.new(title: permit_params[:title], body: permit_params[:body], published_at: @published )
    if new_post.save
      render json: new_post
    else
      render json: ErrorSerializer.serialize(new_post.errors)
    end
  end

  def get_post_by_id
    post = Post.find_by_id(params[:post_id])
    if post.blank?
      render json: "error"
    else
      render json: post
    end
  end

  def get_posts_by_page
    posts = Post.paginate(page: params[:page], per_page: params[:per_page])
    paginate(posts).each do |key,obj|
      response.headers["#{key}"] = obj
    end
    render json: posts
  end

  def report
    render(json: {"errors":{"desc":"email parameter can't be blank"}}) and return if params[:email].blank?
    parameters = {'start_date' => permit_params[:start_date],
                  'end_date' => permit_params[:end_date],
                  'recipient_email' => permit_params[:email]}
    ReportAllWorker.perform_async(parameters)
    render json: {"message":"Report generation started"}
  end

  private

  def check_auth
    auth = request.headers["Authorization"]
    @key = ApiKey.find_by(key: auth)
    render(json: {"errors":{"desc":"check api_key"}}) and return if auth.blank? or @key.blank?
  end

  def check_errors
    check_auth
    has_error = params[:api].blank?
    render(json: {"errors":{"desc":"params can't be blank"}}) and return if true == has_error
  end

  def find_user
    @user = @key.user
  end

  def permit_params
    params.require(:api).permit(:id, :title, :body, :published_at, :page, :per_page, :start_date, :end_date, :email)
  end

  def paginate(object)
    {
      total_pages: object.total_pages,
      total_count: object.count
    }
  end
end
