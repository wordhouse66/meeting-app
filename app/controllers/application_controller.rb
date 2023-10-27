class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :search_clients, :create_calender

  def search_clients
    if current_user
      @q = current_user.clients.ransack(params[:q])
      @clients = @q.result(distinct: true)
    end
  end

  def create_calender
    if Calendar.all.length < 1
      Calendar.create(date_of_choice: Time.now)
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:first_name,:last_name,:profile_name, :phone_number, :description, :image, :location, :sex,:date_of_birth,:email,:password,:remember_me) }
    devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:first_name,:last_name,:profile_name, :phone_number, :description, :image, :location, :sex,:date_of_birth,:email,:password,:current_password) }
  end
end
