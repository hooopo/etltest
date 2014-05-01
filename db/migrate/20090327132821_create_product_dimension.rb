class CreateProductDimension < ActiveRecord::Migration
  def self.up
    fields = {
      # Add dimension attributes here as name => type
      # Example: :store_name => :string
      :id => :integer,
      :description => :string,
      :suggested_retail_price => :float
    }
    create_table :product_dimension do |t|
      fields.each do |name,type|
        t.column name, type
      end
    end
    fields.each do |name,type|
      add_index :product_dimension, name unless type == :text      
    end
  end  

  def self.down
    drop_table :product_dimension
  end
end
