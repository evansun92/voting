class CartsController < ApplicationController
  before_action :authenticate_user!
  include CartsHelper
  include Payable

  def add
    # cart = Cart.from_hash(session[:cart9527]) #不能用Cart.new，不然轉頁面會沒資料 
    # cart.add_item(params[:id])
    # session[:cart9527] = cart.serialize

    current_cart.add_item(params[:id])
    session[:cart9527] = current_cart.serialize

    redirect_to products_path, notice: 'add success'
  end

  def show
  end

  def checkout
    @order = Order.new
    @token = gateway.client_token.generate
  end

  def destroy
    session[:cart9527] = nil
    redirect_to products_path, notice: '購物車已清空'
  end
end