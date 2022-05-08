class List < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :songs, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
