class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def self.user_groups_get(user_self)
    self.where(user_id: user_self)
  end
end
