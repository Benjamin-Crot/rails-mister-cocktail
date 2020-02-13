class Ingredient < ApplicationRecord
  has_many :cocktails
  has_many :doses
  validates :name, uniqueness: true, presence: true
end
