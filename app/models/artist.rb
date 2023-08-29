class Artist < ApplicationRecord
  has_many :events, through: :lineups
  has_many :lineups
end
