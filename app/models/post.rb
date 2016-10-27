class Post < ApplicationRecord
  scope      :newest,     -> { order(created_at: :desc) }
  scope      :date_range, -> (start_d, end_d){where("published_at between ? and ?", start_d.to_date, end_d.to_date)}

  validates  :title, :body, :published_at, presence: true
  belongs_to :user, foreign_key: 'author'
  has_many   :comments
end
