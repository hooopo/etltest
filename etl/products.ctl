infile = 'data/products.txt'
outfile = 'data/product_dimension.txt'


source :in, {
  :file => infile,
  :parser => :csv,
  :skip_lines => 1
}, 
[ 
  :id,
  :description,
  :suggested_retail_price
]

destination :out, {
  :file => outfile,
  :separator => "\t"
},
{
  :order => [:id, :description, :suggested_retail_price]
}

post_process :bulk_import, {
   :file => outfile,
   :truncate => true,
   :columns => [:id,:description,:suggested_retail_price],
   :field_separator => "\t",
   :target => :development,
   :table => 'product_dimension'
 }
