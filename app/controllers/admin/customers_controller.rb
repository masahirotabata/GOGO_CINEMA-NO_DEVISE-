class Admin::CustomersController < ApplicationController
  def show
    @customer = Admin.find_by(id: params[:id])
  end
end
