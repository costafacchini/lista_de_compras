class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :list, index: true
      t.references :product, index: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
