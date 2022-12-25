class Public::AddressesController < ApplicationController
  def edit
    @address = Address.find(params[:id])
  end

  def index
    @addresses = Address.all #きむこーが編集、あっているか不明です・・
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to public_addresses_path
  end


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:success] = '配送先を登録しました'
      redirect_to public_addresses_path
    else
      flash[:danger] = '必要情報を入力してください／ハイフンは使用できません'
      redirect_to public_addresses_path
    end
  end

  #def create　多分使わないけど一応残しているbyきむこー
    #@address = Address.new
    #@customer = current_customer.id
    #@address.save
    #redirect_to public_addresses_path
  #end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end

