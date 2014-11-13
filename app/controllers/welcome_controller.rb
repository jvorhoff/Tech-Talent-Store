class WelcomeController < ApplicationController
  def salesfloor
  	@products = Product.all
  end

  def courses
  	@products = Product.all
  end

  def materials
  	@products = Product.all
  end

  def swag
  	@products = Product.all
  end

  def purchased
    @item = params[:item]
    @quantity = params[:quantity].to_i

    item = Product.find(params[:id])
    @out_of_stock = ""

    if item.quantity > 0
    item.quantity -= @quantity
    item.save
  else
    @out_of_stock = "Sorry, please check back when we have more in stock."
  end
  end
end