class Admin::CustomerTablesController < ApplicationController
  def index
    @customer_tables = CustomerTable.all.page(params[:page])
  end

  def edit
    @customer_table = CustomerTable.find(params[:id])
  end

  def update
    @customer_table = CustomerTable.find(params[:id])
    @customer_table.update(table_params)
    redirect_to admin_customer_tables_path
  end

  def new
    @customer_table = CustomerTable.new()
  end

  def create
    @customer_table = CustomerTable.new(table_params)
    @customer_table.email = "#{SecureRandom.hex(64)}@example.com"
    @customer_table.password = SecureRandom.hex(64)
    @customer_table.save
    redirect_to admin_customer_tables_path
  end

  private

  def table_params
    params.require(:customer_table).permit(:customer_tables_name)
  end
end
