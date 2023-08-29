class Event < ApplicationRecord
  belongs_to :user
  belongs_to :club, optional: true
  has_many :lineups
  has_many :artists, through: :lineups
  has_many :attendees
  has_many :attendees_users, through: :attendees, source: :user
  has_many :posts
  validates :title, presence: true
  validates :description, presence: true
  validates :poster_image, presence: true
  validates :address, presence: true
  has_one_attached :photo
  validates :club_id, presence: true, unless: ->(event) { event.address.present? }
  enum status: [ :pending, :rejected, :accepted ]
end
