class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :group, presence: true, length: { minimum: 1 }
end
