class Admin::SessionsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  def new
  end


  def create
  end
  
  def destroy
    reset_session
    redirect_to new_admin_session_path
  end
end
