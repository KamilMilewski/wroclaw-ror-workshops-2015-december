require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input - birthdate included' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    select '2000', from: 'student[birthdate(1i)]'
    select 'January', from: 'student[birthdate(2i)]'
    select '6', from: 'student[birthdate(3i)]'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
    expect(page).to have_content 'Adrian'
    expect(page).to have_content 'Nowacki'
    expect(page).to have_content '2000-01-06'
  end

  scenario 'with valid input - withoud birthdate' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end
end
