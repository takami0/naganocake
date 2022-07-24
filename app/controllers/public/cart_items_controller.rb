class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      redirect_to public_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    # cart_item = current_customer.cart_item.all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
