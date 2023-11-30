class HomeController < ApplicationController
  def index
    @meetings = Meeting.where(:user_id => current_user.id)
    @calendar = Calendar.new(params[:dater])
  end

  def home
  end
end