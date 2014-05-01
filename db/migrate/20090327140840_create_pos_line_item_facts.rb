class CreatePosLineItemFacts < ActiveRecord::Migration
  def self.up
    create_table :pos_line_item_facts do |t|
      t.integer :id
      t.integer :date_id
      t.integer :product_id
      t.integer :store_id
      t.string  :transaction_number
      t.integer :sales_quantity
      t.float   :sales_dollar_amount
    end
  end
  
  def self.down
    drop_table :pos_line_item_facts
  end
end
