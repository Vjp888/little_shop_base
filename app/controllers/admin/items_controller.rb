class Admin::ItemsController < Admin::BaseController
  before_action :set_merchant

  def index
    # binding.pry
    # @merchant = User.find(params[:merchant_id])
    @items = @merchant.items
    render :'/merchants/items/index'
  end

  def new
    # @merchant = User.find(params[:merchant_id])
    @item = Item.new
    @form_path = [:admin, @merchant, @item]

    render "/merchants/items/new"
  end

  def edit
    # @merchant = User.find(params[:merchant_id])
    @item = Item.find_by(slug: params[:slug])
    @form_path = [:admin, @merchant, @item]

    render "/merchants/items/edit"
  end

  private

  def set_merchant
    @merchant = User.find_by(slug: params[:merchant_slug])
  end
end
