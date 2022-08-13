class Admin::AdminsController < ApplicationController

  # before_action :authenticate_customer!
  # before_action :set_current_customer

  def show
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  private

  def set_current_admin
    @admin = current_admin
  end

  def admin_params
    params.require(:admin).permit(:last_name, :first_name, :email)
  end
end

