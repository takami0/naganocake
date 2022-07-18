class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to public_my_page_path
    else
      render :edit
    end
  end

  def quit
  end

  def leave
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, 
    :postal_code, :address, :telephone_number, :email)
  end
end
