class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:update]

  def update
    cookies[:theme] = params[:theme]
    redirect_to(request.referrer || root_path)
  end
end
