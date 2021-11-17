class User < ApplicationRecord
  has_many :reports
  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }
  validates :email, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  def formatted_name
    "#{first_name} #{last_name} #{email}"
  end
end
