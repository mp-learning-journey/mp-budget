class Group < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_one_attached :icon, dependent: :destroy
end
