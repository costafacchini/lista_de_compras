class AddListRefToListItems < ActiveRecord::Migration
  def change
    add_foreign_key :list_items, :lists
  end
end
