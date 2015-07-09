class AddProductRefToListItems < ActiveRecord::Migration
  def change
    add_foreign_key :list_items, :products
  end
end
