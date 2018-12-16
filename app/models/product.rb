class Product < ApplicationRecord
  scope :missing_price, -> { where(price: nil) }
  scope :missing_description, -> { where(description: nil) }
  validates :number, presence: true
  validates :name, presence: true
end
