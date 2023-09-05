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
    if params[:search].present?
      @genre = params[:search].dig(:genre).drop(1) if params[:search][:genre].present?
      @door_policy = params[:search].dig(:door_policy).drop(1) if params[:search][:door_policy].present?
      @intensity = params[:search].dig(:intensity).drop(1) if params[:search][:intensity].present?
      @queuing_time = params[:search].dig(:queuing_time).drop(1) if params[:search][:queuing_time].present?

      final_query = "#{params[:search][:query]} #{@genre.join(" ")}  #{@door_policy.join(" ")} #{@intensity.join(" ")} #{@queuing_time.join(" ")}"

      @events = Event.search_by_filters(final_query)

    end
    # if params[:query].present?
    #   sql_subquery = <<~SQL
    #     events.title ILIKE :query
    #     OR clubs.name ILIKE :query
    #     OR events.intensity ILIKE :query
    #   SQL
    #   @events = Event.joins(:club).where(sql_subquery, query: "%#{params[:query]}%")

    # else
    #   @events = []
    # end
  end
end
