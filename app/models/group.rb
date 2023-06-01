class Group < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :icon, presence: true
end
