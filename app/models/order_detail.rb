class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :menu

  enum making_status: {未着手:0, 調理中:1, 提供済:2}
    #注文ステータスの変更
  def change_making_status
    menu = self.order.order_details
    if self.making_status == "調理中"
      self.order.update(status: 1)
    elsif menu.pluck(:making_status).all?{ |status| status == "提供済"}
      self.order.update(status: 2)
    elsif menu.pluck(:making_status).all?{ |status| status == "未着手"}
      self.order.update(status: 0)
    end
  end

end
