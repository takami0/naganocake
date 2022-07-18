class Public::AddressesController < ApplicationController
  def index
    @address = Address.new(address_params)
    if @address.save
      redirect_to :index
    else
      render :index
    end
  end

  def edit
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
