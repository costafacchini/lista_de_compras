class List < ActiveRecord::Base
  validates :name, presence: true

  has_many :list_items, dependent: :destroy

  accepts_nested_attributes_for :list_items, allow_destroy: true
end
