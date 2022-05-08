class Group < ApplicationRecord
    has_many :group_users
    has_many :users, through: :group_users
    accepts_nested_attributes_for :group_users
    has_many :lists

    validates :name, presence: true, length: { maximum: 100 }
    validates :description, length: { maximum: 250 }
end
