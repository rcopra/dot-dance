class Post < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :topic, presence: true, inclusion: { in: %w[line vibe general social] }
end
