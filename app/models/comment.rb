class Comment < ApplicationRecord
  before_save :set_published_at
  scope      :date_range, -> (start_d, end_d){where("published_at between ? and ?", start_d.to_date, end_d.to_date)}
  validates  :body, presence: true
  belongs_to :user, foreign_key: 'author'
  belongs_to :post


  def set_published_at
    self.published_at = Time.now.to_date.strftime('%d.%m.%Y %H:%m').to_date
  end
end
