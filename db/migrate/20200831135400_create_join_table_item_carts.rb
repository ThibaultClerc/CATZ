class CreateJoinTableItemCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_item_carts do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.timestamps
    end
  end
end
