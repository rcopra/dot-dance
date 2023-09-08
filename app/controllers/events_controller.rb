class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
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
      @event.club_id = 5
      if @event.save
        redirect_to @event, notice: "Event was successfully created."
      else
        puts @event.errors.full_messages
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
    params.require(:event).permit(:title, :date, :description, :poster_image, :address, :genre, :intensity, :queuing_time, :door_policy, :photo)
  end
end
