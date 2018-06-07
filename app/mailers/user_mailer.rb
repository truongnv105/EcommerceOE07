class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t(".account_activation")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t(".reset_password")
  end

  def order_success order
    @order_details = order.order_details
    mail to: order.user.email, subject: t(".order_success")
  end
end
