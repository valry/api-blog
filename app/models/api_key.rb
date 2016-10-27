class ApiKey < ApplicationRecord
  belongs_to :user

  validates :key, presence: true, uniqueness: true

  before_validation :set_value

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      break token unless ApiKey.where(key: token).exists?
    end
  end

  def set_value
    self.key = generate_token
  end
end
