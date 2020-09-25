class ItemPurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    redirect_to root_path if !user_signed_in? || current_user.id == @item.user_id
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.find(params[:id])
  end
end
