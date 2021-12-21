class Report < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  validates :title, length: { maximum: 250 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validate :correct_range

  def user_data
    User.find(self.user_id).formatted_name
  end

  def correct_range
    if grade.to_i > 100 or grade.to_i < 0
      errors.add('Grade should be in range 0..100' )
    end
  end
end