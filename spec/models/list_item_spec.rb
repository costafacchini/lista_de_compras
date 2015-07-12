require "rails_helper"

RSpec.describe ListItem, type: :model do
  it { should validate_numericality_of(:quantity).only_integer }

  it { should belong_to(:product) }
  it { should belong_to(:list) }
end
