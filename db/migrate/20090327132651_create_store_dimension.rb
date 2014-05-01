class CreateStoreDimension < ActiveRecord::Migration
  def self.up
    fields = {
      :id => :integer, 
      :store_number => :string, 
      :store_region => :string, 
      :store_state => :string
    }
    create_table :store_dimension do |t|
      fields.each do |name,type|
        t.column name, type
      end
    end
    fields.each do |name,type|
      add_index :store_dimension, name unless type == :text      
    end
  end

  def self.down
    drop_table :store_dimension
  end
end
