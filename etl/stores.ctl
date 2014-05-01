require 'csv'
class StoreParser < ETL::Parser::CsvParser
  include Enumerable
  def initialize(source)
    @parser = ETL::Parser::CsvParser.new(source)
    super
  end
  
  def each
    @parser.each do |store|
      row = {}
      row[:id] = store[:id]
      row[:store_number] = store[:store_number]
      
      state = lookup_state(store[:state_id])
      row[:store_state] = state[3]
      
      region = lookup_region(state[1])
      #puts "region #{state[1]} is #{region[1]}"
      row[:store_region] = region[1]

      yield row
    end
  end
  
  private
  def lookup_region(id)
    #puts "lookup region #{id}"
    @regions ||= load_regions
    @regions.each do |region|
      return region if region[0] == id
    end
    raise ArgumentError, "Region not found for id #{id}"
  end
  def load_regions
    regions = ::CSV.read(File.dirname(__FILE__) + "/data/regions.txt")
    regions.shift
    regions
  end
  def lookup_state(id)
    @states ||= load_states
    @states.each do |state|
      return state if state[0] == id
    end
    raise ArgumentError, "State not found for id #{id}"
  end
  def load_states
    states = ::CSV.read(File.dirname(__FILE__) + "/data/states.txt")
    states.shift
    states
  end
end

infile = 'data/stores.txt'
outfile = 'data/store_dimension.txt'

source :in, {
  :file => infile,
  :parser => StoreParser,
  :skip_lines => 1
}, 
[
  :id,
  :state_id,
  :store_number
]

destination :out, {
  :file => outfile,
  :separator => "\t"
},
{
  :order => [:id, :store_number, :store_region, :store_state]
}

 post_process :bulk_import, {
   :file => outfile,
   :truncate => true,
   :columns => [:id, :store_number, :store_region, :store_state],
   :field_separator => "\t",
   :target => :development,
   :table => 'store_dimension'
 }
