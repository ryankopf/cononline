class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :current_cart
  before_action :combine_carts

  def set_current_user
    current_user
  end

  protected
  def require_login
    redirect_to '/signup' if current_user.nil?
  end
  def current_user
    @current_user ||= login_from_session
  end
  def current_cart
    @current_cart ||= cart_from_user || cart_from_session || new_cart
  end
  def cart_from_user
    @current_user&.cart
  end
  def cart_from_session
    Cart.find_by(id: request.session[:cart_id])
  end
  def new_cart
    cart = Cart.create(user: @current_user)
    request.session[:cart_id] = cart.id
    cart
  end
  def login_from_session
    request.session[:user_id] ? User.find_by(id: request.session[:user_id]) : nil
  end
  def require_admin
    redirect_to '/signup' unless @current_user&.admin?
  end
  def combine_carts
    if cart_from_user && cart_from_session
      cart_from_user.absorb_other_cart(cart_from_session)
    end
  end

end
