class List < ApplicationRecord
  belongs_to :user
  has_many :searches, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
