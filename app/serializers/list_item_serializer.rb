class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  has_one :product
end
