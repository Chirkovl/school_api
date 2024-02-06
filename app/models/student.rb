class Student < ApplicationRecord
  belongs_to :klass
  belongs_to :magic_school
  has_one :student_auth, dependent: :destroy

  after_create :update_class_students_count
  after_destroy :decrement_class_students_count

  validates :first_name, :last_name, :surname, :klass_id, :magic_school_id, presence: true

  private

  def update_class_students_count
    klass.increment!(:students_count)
  end

  def decrement_class_students_count
    klass.decrement!(:students_count)
  end
end