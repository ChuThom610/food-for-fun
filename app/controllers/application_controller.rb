class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  include UsersHelper
  include ImagesHelper
  include OrderDetailsHelper
  include RestaurantsHelper
  include FoodsHelper
  include CategoriesHelper
  include OrdersHelper

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "flashs.please_login"
    redirect_to signin_url
  end
end
