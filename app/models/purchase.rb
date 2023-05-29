class Purchase < ApplicationRecord
  belongs_to :author
  belongs_to :group
end
