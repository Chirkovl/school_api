class Klass < ApplicationRecord
  has_many :students
  belongs_to :magic_school

  validates :number, :letter, presence: true
end