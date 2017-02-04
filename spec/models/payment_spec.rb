require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :year }
    it { is_expected.to validate_presence_of :month }
    it 'should validate uniqueness of student_id scoped to year & month' do
      should validate_uniqueness_of(:student_id).scoped_to(:year, :month)
    end
    it 'should validate year to be in sensible range' do
      should validate_numericality_of(:year).is_greater_than(1900)
        .is_less_than(2100)
    end
    it 'should validate month to be between 1 and 12' do
      should validate_numericality_of(:year).is_greater_than(0)
        .is_less_than(13)
    end
  end

  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :year }
    it { should have_db_column :month }
    it { should have_db_column :paid_at }
  end
end
