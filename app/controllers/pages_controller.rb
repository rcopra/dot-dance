class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def search
    if params[:query].present?
      sql_subquery = <<~SQL
        events.title ILIKE :query
        OR clubs.name ILIKE :query
      SQL
      @events = Event.joins(:club).where(sql_subquery, query: "%#{params[:query]}%")
    else
      @events = []
    end
  end

end
