class Public::SessionsController < ApplicationController

   def new
  end

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
     log_in customer
      redirect_to  public_customer_path(current_customer)
    else
      # エラーメッセージを作成する
      flash[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
    end
  end

  def index
  end


   def destroy
    session[:customer_id] = nil
    flash[:notice] ="ログアウトしました"
    redirect_to public_session_path
   end

   def customer_params
    params.require(:customer).permit(:email, :password)
  end


end
