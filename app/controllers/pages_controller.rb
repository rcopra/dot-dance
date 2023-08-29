class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end
