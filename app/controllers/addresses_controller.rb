class AddressesController < ApplicationController
  def index
    bussiness_card = current_user.bussiness_cards.find(params[:b_card_id])
    @addresses = bussiness_card.addresses.paginate(:page => params['page'], :per_page => 20)
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new(params[:address])
    @address.bussiness_card = BCard.find(params[:b_card_id])
    if @address.save
      flash[:notice] = "Successfully created address."
      redirect_to(b_card_addresses_url(params[:b_card_id]))
    else
      render :action => 'new'
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      flash[:notice] = "Successfully updated address."
      redirect_to b_card_addresses_url(params[:b_card_id])
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "Successfully destroyed address."
    redirect_to b_card_addresses_url(params[:b_card_id])
  end
end
