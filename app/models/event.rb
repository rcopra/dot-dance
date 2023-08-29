class Event < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :club
  validates :title, presence: true
  validates :description, presence: true
  validates :poster_image, presence: true
  validates :address, presence: true
end
