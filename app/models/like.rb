class Like < ApplicationRecord
  belongs_to :pine
  belongs_to :user

  validates_uniqueness_of :pine_id, scope: :user_id
end
