class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :clubs
  has_many :events
  has_many :attendees
  has_many :attended_events, through: :attendees, source: :event
  has_many :posts
  has_many :comments
end
