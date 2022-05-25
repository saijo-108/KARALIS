class Group < ApplicationRecord
    include Hashid::Rails
    has_many :group_users
    has_many :users, through: :group_users, dependent: :destroy

    has_many :list_groups
    has_many :lists, through: :list_groups, dependent: :destroy

    validates :name, presence: true, length: { maximum: 20 }
    validates :description, length: { maximum: 250 }

    def add_list_groups(list)
        lists << list
    end

    def delete_list_groups(list)
        lists.delete(list)
    end
end
