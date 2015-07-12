class Product < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :list_items, dependent: :restrict_with_error
end
