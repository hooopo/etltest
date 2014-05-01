class HomeController < ApplicationController

  def index
  end
  
  def sales_report
    @report = ActiveWarehouse::Report::TableReport.new #(report_params)
    @report.cube_name = :store_sales_cube
    @report.column_dimension_name = :date
    @report.row_dimension_name = :store

    @view = @report.view(params)
  end
  
  def day_report
    @report = ActiveWarehouse::Report::TableReport.new #(report_params)
    @report.cube_name = :store_sales_cube
    @report.column_dimension_name = :date
    @report.row_dimension_name = :store
    @report.column_hierarchy = :day_of_week
    
    @view = @report.view(params)
  end
end
