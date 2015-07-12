class ListSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :list_items
end
