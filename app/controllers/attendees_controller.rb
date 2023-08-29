class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @attendee = Attendee.new(attendee_params)
    @attendee.event = @event
    @attendee.user = current_user
    if @attendee.save
      redirect_to @event, notice: "You're attending"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @attendee.destroy
  end

  private

  def attendee_params
    params.require(:attendee).permit(:start_date, :end_date)
  end
end
