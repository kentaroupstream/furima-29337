class ItemPurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    redirect_to root_path if !user_signed_in? || current_user.id == @item.user_id
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :item_id, :postal_code, :prefecture, :city, :addresses, :building, :phone_number)
  end

end
