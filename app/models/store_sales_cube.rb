class StoreSalesCube < ActiveWarehouse::Cube
  reports_on :pos_line_item
  pivots_on :date, :store
end
