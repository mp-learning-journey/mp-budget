class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon, dependent: :destroy
end
