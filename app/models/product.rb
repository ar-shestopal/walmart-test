class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :price, presence: true
  validates :name, uniqueness: true
end
