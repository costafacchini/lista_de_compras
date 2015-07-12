class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :product

  validates :quantity, numericality: { only_integer: true }
end
