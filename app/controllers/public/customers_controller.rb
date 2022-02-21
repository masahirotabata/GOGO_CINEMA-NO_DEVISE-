class Public::CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
      if @customer.save
        session[:customer_id] = @customer.id
        flash[:notice] = "ユーザー登録に成功しました"
        redirect_to public_customer_path(@customer)
      else
        render new_pablic_customer_path
      end
  end

  def show
    @customer = Customer.find_by(id: params[:id])
  end

   def edit
    @customer = Customer.find_by(id: params[:id])

  end

   def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer), notice: "ユーザー情報を更新しました。"
    else
      render "edit"
    end
  end

def create
    customer=Customer.find_by(email: customer_params[:email])#まず、送られてきたメースアドレスでユーザーを検索する

      if customer&.authenticate(customer_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
      session[:customer_id]=customer.id#認証に成功した場合に、セッションにcustomer_idを格納しています。

      redirect_to root_path, notice: 'ログインしました'

    else
      render :new
    end
  end

  def session_form
    customer=Customer.find_by(email: customer_params[:email])#まず、送られてきたメースアドレスでユーザーを検索する

      if customer&.authenticate(customer_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
      session[:customer_id]=customer.id#認証に成功した場合に、セッションにcustomer_idを格納しています。

      redirect_to root_path, notice: 'ログインしました'

    else
      render :new
    end
  end

  def sessionout
    session[:customer_id] = nil
    flash[:notice] ="ログアウトしました"
    redirect_to public_session_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :email, :password, :image, :infomation)
  end

   def current_customer
        if session[:customer_id]
            current_customer ||= Customer.find(session[:customer_id])
        end
   end

end
