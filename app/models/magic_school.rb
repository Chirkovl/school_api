class MagicSchool < ApplicationRecord
  has_many :students
  has_many :klasses

  validates :name, presence: true
end