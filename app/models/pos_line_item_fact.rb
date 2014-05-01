class PosLineItemFact < ActiveWarehouse::Fact
  aggregate :id,            :type => :count,  :label => "Purchases"
  
  dimension :date
  dimension :store
  dimension :product
  
  belongs_to :date,     :class_name => "DataDimension"
  belongs_to :store,    :class_name => "StoreDimension"
  belongs_to :product,  :class_name => "ProductDimension"
end
