module Public::SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def current_customer
    @current_user ||= Customer.find_by(id: session[:customer_id])
  end

  def logged_in?
    !current_customer.nil?
  end

end
