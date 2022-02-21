class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 include Public::SessionsHelper
 def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]

  end
end
