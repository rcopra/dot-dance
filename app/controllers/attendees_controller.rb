class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    raise
    @event = Event.find(params[:event_id])
    @attendee = Attendee.new
    @attendee.event = @event
    @attendee.user = current_user
    if @attendee.save
      redirect_to @event, notice: "You're attending"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find_by(user: current_user)
    if @attendee
      @attendee.destroy
      redirect_to @event, notice: "You are no longer attending this event."
    else
      redirect_to @event, alert: "You are not attending this event."
    end
  end
end
