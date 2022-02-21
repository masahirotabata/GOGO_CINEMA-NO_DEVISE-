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
