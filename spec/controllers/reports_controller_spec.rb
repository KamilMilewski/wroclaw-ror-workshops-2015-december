require 'spec_helper'

feature 'User visits student payments page' do
  let!(:student_1) { create :student, first_name: 'Jan', last_name: 'Adam' }
  let!(:payment_1) do
    create :payment, student: student_1,
                     year: 2000,
                     month: 6,
                     paid_at: Date.new(2000, 6, 23)
  end

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see students list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Adam'
    expect(page).to have_content '2000'
    expect(page).to have_content '6'
    expect(page).to have_content '2000-06-23'
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
