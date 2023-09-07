class Post < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments
  validates :title, presence: true
  validates :topic, presence: true, inclusion: { in: %w[queuing vibe general social] }
end
