class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def about
  end

  def users
  end

  def destroy
  end
  
end
