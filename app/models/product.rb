class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :price, presence: true
end
