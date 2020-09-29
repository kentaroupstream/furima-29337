class ItemPurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    redirect_to root_path if !user_signed_in? || current_user.id == @item.user_id
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_live_8999c9d1bc4605b308893680af1218188945e65ed2b823adcbf3c291"
    Payjp::Charge.create(
      amount: purchase_params[:price],   # 商品の値段
      card: purchase_params[:token],     # カードトークン
      current: 'jpy'                     # 通貨の種類（日本円）
    )
  end
end
