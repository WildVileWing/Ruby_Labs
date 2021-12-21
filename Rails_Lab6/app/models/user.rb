class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  def formatted_name
    "#{first_name} #{last_name} #{email}"
  end
end
