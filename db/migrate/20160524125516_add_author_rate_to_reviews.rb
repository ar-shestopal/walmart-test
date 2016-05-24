class AddAuthorRateToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :author, :string
    add_column :reviews, :rate, :integer
  end
end
