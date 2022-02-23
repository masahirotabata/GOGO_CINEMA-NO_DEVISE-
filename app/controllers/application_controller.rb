class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
  before_action :authenticate_customer
  helper_method :current_current_customer, :logged_in?
 include Public::SessionsHelper
 def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]

 def require_session
    if session[:customer_email].nil?
      redirect_to login_path
    end
 end

  end

   private

    def authenticate_customer

      redirect_to new_public_session_path unless logged_in?

    end

    def logged_in?

      current_customer.present?

    end

    def log_out

      session.delete(:customer_id)

      @current_customer= nil

    end
end
