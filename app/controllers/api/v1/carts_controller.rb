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

  def address_create
    @address = current_user.addresses.new(address_params)
    if @address.save
       return render json: @address ,status: :ok
    else
      return render json: @address.errors, status: :unprocessable_entity
    end
  end

  def create
  end

  private
  def address_params
    params.permit(:full_name, :phone_number, :pin_code, :district, :state, :city, :house_no, :colony_name)
  end

end
