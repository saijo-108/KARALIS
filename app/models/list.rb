class List < ApplicationRecord
  belongs_to :user
  has_many :list_groups
  has_many :groups, through: :list_groups, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }

  def self.user_lists_get(user_self)
    self.where(user_id: user_self)
  end
end
