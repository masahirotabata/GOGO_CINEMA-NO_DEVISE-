class Public::HomesController < ApplicationController
  #
  def top
    @customer =Customer.find_by(id: current_customer)
  end
end
