class JoinOrderItem < ApplicationRecord
  after_save :after_order
  belongs_to :order
  belongs_to :item

  def after_order
    UserMailer.after_order(self).deliver_now
  end
end
