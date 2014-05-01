require File.expand_path('../../config/environment.rb', __FILE__)

infile = 'data/transactions.txt'
outfile = 'data/pos_line_item_facts.txt'

set_error_threshold 50

source :in, {
  :file => infile,
  :parser => :csv,
  :skip_lines => 1
}, 
[
  :id,
  :transaction_number,
  :qty,
  :sales_amount,
  :product_id,
  :store_id,
  :date_id
]

rename :sales_amount, :sales_dollar_amount
rename :qty, :sales_quantity
transform :date_id, :string_to_date
transform :date_id, :foreign_key_lookup, :resolver => ActiveRecordResolver.new(DateDimension, :find_by_sql_date_stamp)

destination :out, {
  :file => outfile,
  :separator => " "
},
{
  :order => [:id, :date_id, :product_id, :store_id, :transaction_number, :sales_quantity, :sales_dollar_amount]
}

 post_process :bulk_import, {
   :file => outfile,
   :truncate => true,
   :columns => [:id, :date_id, :product_id, :store_id, :transaction_number, :sales_quantity, :sales_dollar_amount],
   :field_separator => " ",
   :target => :development,
   :table => 'pos_line_item_facts'
 }
