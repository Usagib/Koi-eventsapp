# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create new user, signup' do
    scenario 'should create new user' do
      DatabaseCleaner.clean
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'EduardoTest1'
        fill_in 'Email', with: 'eduardotest921@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Confirmation', with: '123456'
      end
      click_button 'Join'
      expect(page).to have_content('Welcome EduardoTest1')
    end

    scenario 'should not create new user' do
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'EduardoTest'
        fill_in 'Email', with: 'eduardotest1@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Confirmation', with: '1234567'
      end
      click_button 'Join'
      expect(page).to have_content('Password confirmation doesn\'t match')
    end
  end
end
