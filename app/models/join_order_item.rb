class JoinOrderItem < ApplicationRecord
  after_save :after_order, :admin_alert
  belongs_to :order
  belongs_to :item

  def after_order
    UserMailer.after_order(self).deliver_now
  end

  def admin_alert
  	UserMailer.admin_alert(self).deliver_now
  end
end
