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
  # validates :poster_image, presence: true <- Commenting this out while I work on event adding so I don't need to add a photo every time
  validates :address, presence: true
  validates :date, presence: true
  has_one_attached :photo
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  validates :genre, presence: true, inclusion: { in: %w[techno house acid garage minimal] }
  validates :intensity, presence: true, inclusion: { in: %w[low medium extreme high] }
  validates :queuing_time, presence: true, inclusion: { in: %w[long average short] }
  validates :door_policy, presence: true, inclusion: { in: %w[strict average easy] }
end
