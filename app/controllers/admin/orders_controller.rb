class Admin::OrdersController < Admin::BaseController
  before_action :set_user, only: [:index, :show]

  def index
    @orders = @user.orders
    render :'/profile/orders/index'
  end

  def show
    @order = Order.find(params[:id])

    if @order.user_id != @user.id
      render file: 'errors/not_found', status: 404
    else
      render '/profile/orders/show'
    end
  end

  def merchant_show
    @merchant = User.find_by(slug: params[:merchant_slug])
    @order = Order.find(params[:id])
    @user = @order.user
    @order_items = @order.order_items_for_merchant(@merchant.id)

    render '/merchants/orders/show'
  end

  private

  def set_user
    @user = User.find_by(slug: params[:user_slug])
  end
end
