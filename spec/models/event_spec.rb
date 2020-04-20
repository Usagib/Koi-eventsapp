# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create(username: 'Test_user', email: 'test@user.com',
                        password: '123456', password_confirmation: '123456')
    @event = Event.create(name: 'Test Event', description: 'Test Description',
                          event_date: '2020-04-02 12:30PM', user_id: 1)
  end

  after(:each) do
    @user.destroy
    @event.destroy
  end

  describe 'Event Model Validations' do
    it 'has true valid value if attributes are valid' do
      expect(@event.valid?).to eq(true)
    end

    it 'is valid with enough validated attributes' do
      @event.location = ''
      expect(@event.valid?).to eq(true)
    end

    it 'is invalid with empty description' do
      @event.description = ''
      expect(@event.valid?).to eq(false)
    end

    it 'is invalid with empty name' do
      @event.name = ''
      expect(@event.valid?).to eq(false)
    end

    it 'is invalid with invalid user belonging' do
      @event.user_id = ''
      expect(@event.valid?).to eq(false)
    end
  end

  context 'ActiveRecord associations' do
    it { should have_many(:attendees) }

    it { should have_many(:attendances) }

    it { should belong_to(:user) }
  end

  context 'ActiveRecord Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:event_date) }
  end
end
