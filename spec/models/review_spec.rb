require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:product) }
  it { should validate_presence_of(:product)}
end
