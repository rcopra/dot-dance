class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def event_date_formatted
    self.event.date.strftime("%b %e %Y")
  end
end
