class AvatarController < ApplicationController

  def index
    render 'index'
  end

  def create_avatar
    if params[:file].present?
      cloudi_params = Cloudinary::Uploader.upload(params[:file])
      user = User.find(session[:current_user])
      if user.avatar.image_id.nil?
        user.create_avatar image_id: cloudi_params["public_id"]
      else
        image_id = user.avatar.image_id
        Cloudinary::Uploader.destroy(image_id, :invalidate => true)
        user.avatar.update_attribute :image_id, cloudi_params["public_id"]
      end
    end
    redirect_to action: 'show_avatar'
  end

  def show_avatar
    case request.request_method_symbol
      when :get
        render 'index' and return flash[:notice] = "User can't be blank" if session[:current_user].blank?
        @user = User.find_by_id(session[:current_user])
        render 'avatar'
      when :post
        if params[:nickname].present?
          session[:current_user] = cache_user(params[:nickname])
          @user = User.find_by_id(session[:current_user])
        else
          flash[:notice] = "User can't be blank"
          render 'index' and return
        end

        if @user.blank?
          flash[:notice] = "Can't found this nickname"
          render 'index' and return
        end
        @nickname = @user
        render 'avatar' and return
    end
  end

  private

  def cache_user(param)
    user = User.find_by_nickname(param)
    return user.id unless user.blank?
    return nil
  end

end
