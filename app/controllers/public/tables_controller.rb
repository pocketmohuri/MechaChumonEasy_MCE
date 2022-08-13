class Public::TablesController < ApplicationController
  # before_action :authenticate_table!
  # before_action :set_current_table

  def new
  end

  def show
  end

  def edit
  end

  private

  def set_current_table
    @table = current_table
  end

  def table_params
    params.require(:table).permit(:tables_id, :table_name,)
  end
  #tables_idをtable_idに変更。まずはschemaの内容を直す。
end


