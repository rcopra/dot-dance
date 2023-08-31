class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    if params[:query].present?
      sql_subquery = <<~SQL
        events.name ILIKE :query
        OR events.description ILIKE :query
      SQL
      @events = @events.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @attendee = Attendee.new
    @lineup = @event.lineups
    @markers = [{ lat: @event.latitude, lng: @event.longitude, info_window_html: render_to_string(partial: "info_window", locals: { event: @event }), marker_html: render_to_string(partial: "marker") }]
  end

  def new
    @event = Event.new
  end

  def create
    if user_signed_in?
      @event = Event.new(event_params)
      @event.user = current_user
      if @event.save
        redirect_to @event, notice: "Event was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
    if current_user == @event.user
      if @event.update(event_params)
        redirect_to @event, notice: "Event was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if current_user == @event.user
      @event.destroy
      redirect_to events_path, notice: "Event was successfully destroyed.", status: :see_other
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :poster_image, :address)
  end
end
