class ThemesController < ApplicationController
  def update
    cookies[:theme] = params[:theme]
    redirect_to(request.referrer || root_path)
  end
end
