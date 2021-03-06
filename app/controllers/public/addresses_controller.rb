class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @addresses = Address.all
    if @address.save
      redirect_to public_addresses_path
    else
      render :index
    end
  end

  def edit
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
