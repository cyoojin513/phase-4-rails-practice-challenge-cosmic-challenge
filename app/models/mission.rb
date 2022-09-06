class Mission < ApplicationRecord
  validates :name, :scientist, :planet, presence: true
  validates :scientist, uniqueness: {scope: :name}

  belongs_to :scientist
  belongs_to :planet
end
