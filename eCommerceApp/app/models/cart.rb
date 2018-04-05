class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :user_choice, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
