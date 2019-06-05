module CartsHelper
  def current_cart
     @cc ||= Cart.from_hash(session[:cart9527])
  end
end
