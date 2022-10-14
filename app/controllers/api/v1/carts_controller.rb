class Api::V1::CartsController < ApplicationController
  def index
    orders = Order.all
    render json: orders, status:200
  end
  

  def show
  end

  def address
    add_address = Address.new
    render json: add_address, status:200
  end



  def create
  end
end
