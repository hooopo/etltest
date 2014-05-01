class ProductDimension < ActiveWarehouse::Dimension
  define_hierarchy :description, [:description]
end
