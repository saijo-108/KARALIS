class List < ApplicationRecord
  belongs_to :user
  has_many :list_groups
  has_many :groups, through: :list_groups
  has_many :songs, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
