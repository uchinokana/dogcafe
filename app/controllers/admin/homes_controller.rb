class Admin::HomesController < ApplicationController
  def top
    @orders = Order.find(params[:id])
  end
end
