# frozen_string_literal: true

require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.feature 'Event', type: :feature do
  context 'Create new event' do
    subject do
      User.new(username: 'testname', email: 'testing@usagi.com',
               password: '123456', password_confirmation: '123456')
    end
    before do
      subject.save
      visit login_path
      within('form') do
        fill_in 'Email', with: 'testing@usagi.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Login'
    end

    scenario 'should create new event' do
      visit create_path
      within('form') do
        fill_in 'Name', with: 'new event'
        fill_in 'Description', with: 'testdescription'
        fill_in 'Location', with: 'testlocation'
        fill_in 'Category', with: 'testcategory'
      end
      click_button 'Create an event'
      expect(page).to have_content('new event')
    end
  end
end

# rubocop: enable Metrics/BlockLength
