class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    @item = CartItem.new(cart_item_params)
    if @item.save
      redirect_to public_cart_items_path
    else
      redirect_to public_item_path(@item.id)
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
