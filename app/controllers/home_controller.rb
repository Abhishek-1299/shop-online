class HomeController < ApplicationController
  def index

    respond_to do |format|
      format.html {
        @products = Product.all
        if current_user.present?
          @email = current_user.email
        end
      }
      format.json {
         render json: Product.all
      }
    end
  end


    #@order_item = current_order.order_items
  # end

  def about
  end

  def users
  end

  def destroy
  end
  
end
