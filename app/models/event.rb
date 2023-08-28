class Event < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :club
end
