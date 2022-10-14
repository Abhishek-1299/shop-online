class Api::V1::ProductsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    @products = Product.all
    render json: @products.as_json(methods: [:image_url]), status: 200
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.present?
      render json: @product.as_json(methods: [:image_url]), status: 200
    else
      render json: {error: "not found product"}
    end
  end

  def create
    product = Product.new(prod_params)

    if product.save
      render json: product.as_json(include: [:category], methods: [:image_url]), status: 200
    else
      render json: {error: "Product not create"}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(prod_params)
      render json: @product, status: 200
    else 
      render json: {error: "not updated"}
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: {message: 'Successfully deleted'}
    end
  end

  private
  def prod_params
    params.require(:product).permit([:name, :price, :category_id, :desc, :image])

  end

end
