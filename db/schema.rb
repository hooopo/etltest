# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090327140840) do

  create_table "date_dimension", :force => true do |t|
    t.string  "date"
    t.text    "full_date_description"
    t.string  "day_of_week"
    t.integer "day_number_in_calendar_month"
    t.integer "day_number_in_calendar_year"
    t.integer "day_number_in_fiscal_month"
    t.integer "day_number_in_fiscal_year"
    t.string  "calendar_week"
    t.integer "calendar_week_number_in_year"
    t.string  "calendar_month_name"
    t.integer "calendar_month_number_in_year"
    t.string  "calendar_year_month"
    t.string  "calendar_quarter"
    t.string  "calendar_year_quarter"
    t.string  "calendar_year"
    t.string  "fiscal_week"
    t.integer "fiscal_week_number_in_year"
    t.string  "fiscal_year_month"
    t.string  "fiscal_quarter"
    t.string  "fiscal_year_quarter"
    t.string  "fiscal_year"
    t.string  "holiday_indicator"
    t.string  "weekday_indicator"
    t.string  "selling_season"
    t.string  "major_event"
    t.date    "sql_date_stamp"
  end

  add_index "date_dimension", ["calendar_month_name"], :name => "index_date_dimension_on_calendar_month_name"
  add_index "date_dimension", ["calendar_month_number_in_year"], :name => "index_date_dimension_on_calendar_month_number_in_year"
  add_index "date_dimension", ["calendar_quarter"], :name => "index_date_dimension_on_calendar_quarter"
  add_index "date_dimension", ["calendar_week"], :name => "index_date_dimension_on_calendar_week"
  add_index "date_dimension", ["calendar_week_number_in_year"], :name => "index_date_dimension_on_calendar_week_number_in_year"
  add_index "date_dimension", ["calendar_year"], :name => "index_date_dimension_on_calendar_year"
  add_index "date_dimension", ["calendar_year_month"], :name => "index_date_dimension_on_calendar_year_month"
  add_index "date_dimension", ["calendar_year_quarter"], :name => "index_date_dimension_on_calendar_year_quarter"
  add_index "date_dimension", ["date"], :name => "index_date_dimension_on_date"
  add_index "date_dimension", ["day_number_in_calendar_month"], :name => "index_date_dimension_on_day_number_in_calendar_month"
  add_index "date_dimension", ["day_number_in_calendar_year"], :name => "index_date_dimension_on_day_number_in_calendar_year"
  add_index "date_dimension", ["day_number_in_fiscal_month"], :name => "index_date_dimension_on_day_number_in_fiscal_month"
  add_index "date_dimension", ["day_number_in_fiscal_year"], :name => "index_date_dimension_on_day_number_in_fiscal_year"
  add_index "date_dimension", ["day_of_week"], :name => "index_date_dimension_on_day_of_week"
  add_index "date_dimension", ["fiscal_quarter"], :name => "index_date_dimension_on_fiscal_quarter"
  add_index "date_dimension", ["fiscal_week"], :name => "index_date_dimension_on_fiscal_week"
  add_index "date_dimension", ["fiscal_week_number_in_year"], :name => "index_date_dimension_on_fiscal_week_number_in_year"
  add_index "date_dimension", ["fiscal_year"], :name => "index_date_dimension_on_fiscal_year"
  add_index "date_dimension", ["fiscal_year_month"], :name => "index_date_dimension_on_fiscal_year_month"
  add_index "date_dimension", ["fiscal_year_quarter"], :name => "index_date_dimension_on_fiscal_year_quarter"
  add_index "date_dimension", ["holiday_indicator"], :name => "index_date_dimension_on_holiday_indicator"
  add_index "date_dimension", ["major_event"], :name => "index_date_dimension_on_major_event"
  add_index "date_dimension", ["selling_season"], :name => "index_date_dimension_on_selling_season"
  add_index "date_dimension", ["sql_date_stamp"], :name => "index_date_dimension_on_sql_date_stamp"
  add_index "date_dimension", ["weekday_indicator"], :name => "index_date_dimension_on_weekday_indicator"

  create_table "pos_line_item_facts", :force => true do |t|
    t.integer "date_id"
    t.integer "product_id"
    t.integer "store_id"
    t.string  "transaction_number"
    t.integer "sales_quantity"
    t.float   "sales_dollar_amount"
  end

  create_table "product_dimension", :force => true do |t|
    t.string "description"
    t.float  "suggested_retail_price"
  end

  add_index "product_dimension", ["description"], :name => "index_product_dimension_on_description"
  add_index "product_dimension", ["id"], :name => "index_product_dimension_on_id"
  add_index "product_dimension", ["suggested_retail_price"], :name => "index_product_dimension_on_suggested_retail_price"

  create_table "store_dimension", :force => true do |t|
    t.string "store_number"
    t.string "store_region"
    t.string "store_state"
  end

  add_index "store_dimension", ["id"], :name => "index_store_dimension_on_id"
  add_index "store_dimension", ["store_number"], :name => "index_store_dimension_on_store_number"
  add_index "store_dimension", ["store_region"], :name => "index_store_dimension_on_store_region"
  add_index "store_dimension", ["store_state"], :name => "index_store_dimension_on_store_state"

end
