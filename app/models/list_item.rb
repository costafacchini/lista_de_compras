class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :product
end
