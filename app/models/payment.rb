class Payment < ActiveRecord::Base
  belongs_to :student
  validates_numericality_of :year, only_integer: true
  validates_numericality_of :month, only_integer: true
  validates :year, presence: true, inclusion: 1900..2100
  validates :month, presence: true, inclusion: 1..12
  validates :student_id, uniqueness: { scope: [:year, :month] }
end
