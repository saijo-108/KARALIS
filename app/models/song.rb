class Song < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :list_id, uniqueness: { scope: %i[song_title artist] }

  enum status: { release: 0, nonrelease: 1 }
end
