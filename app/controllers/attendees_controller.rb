class AttendeesController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery with: :null_session

  def create
    @event = Event.find(params[:event_id])
    @attendee = Attendee.new
    @attendee.event = @event
    @attendee.user = current_user
    @attendee.save
  end

  def update
    raise
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find_by(user: current_user)
    if @attendee
      @attendee.destroy
      redirect_to event_path(@event), notice: "You are no longer attending this event."
    else
      redirect_to event_path(@event), alert: "You are not attending this event."
    end
  end
end
