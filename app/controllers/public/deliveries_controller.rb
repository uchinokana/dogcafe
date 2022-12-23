class Public::DeliveriesController < ApplicationController#きむこーが編集あっているか不明です・・


#配送先登録/一覧画面
  def index
    @addresses = Address.all
    @addresses = Address.new
  end


#配送先編集画面
  def edit
    @addresses = Address.find(params[:id])
  end


#配送先の登録
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      flash[:success] = '配送先を登録しました'
      redirect_to public_deliveries_path
    else
      flash[:danger] =　'必要情報を入力してください／ハイフンは使用できません'
      redirect_to public_deliveries_path
    end
  end


#配送先の更新
  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:success] = '編集を保存しました'
      redirect_to public_deliveries_path
    else
      @addresses = Address.find(params[:id])
      flash[:danger] = '必要情報を入力してください／ハイフンは使用できません'
      render "public/deliveries/index"
    end
  end


#配送先の削除
  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:success] = '削除しました'
    redirect_to public_deliveries_path
  end
end
