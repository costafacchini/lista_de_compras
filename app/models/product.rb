class Product < ActiveRecord::Base
  has_many :list_items, dependent: :restrict_with_error
end
