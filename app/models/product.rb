class Product < ApplicationRecord
  validates :number, presence: true
  validates :name, presence: true
end
