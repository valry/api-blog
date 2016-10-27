Rails.application.routes.draw do

  root 'avatar#index'
  match 'show_avatar' => 'avatar#show_avatar', via: [:get,:post]
  post 'create_avatar' => 'avatar#create_avatar'
  namespace :api do
    namespace :v1 do
      get  'posts' => 'api#get_posts_by_page'
      get  'posts/:post_id' => 'api#get_post_by_id'
      post 'posts' => 'api#create_post'
      post 'reports/by_author' => 'api#report'
    end
  end
end






# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
