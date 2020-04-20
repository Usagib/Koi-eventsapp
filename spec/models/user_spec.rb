# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(username: 'Test_user', email: 'test@user.com', password: '123456',
                        password_confirmation: '123456')
    @event = Event.create(name: 'Test Event', description: 'Test Description',
                          event_date: '2020-04-02 12:30PM', user_id: 1)
  end

  it 'Name should exist' do
    @user.username = nil
    expect(@user).to_not be_valid
  end

  it 'Email should exist' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'Email should have correct format' do
    @user.email = 'foo.bar.com'
    expect(@user).to_not be_valid
  end

  it 'user should save with correct email' do
    @user.email = 'foo@bar.com'
    expect(@user).to be_valid
  end

  it 'password should exist' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'Username should not be too short' do
    @user.username = 'un'
    expect(@user).to_not be_valid
  end

  it 'Password should not be too short' do
    @user.password = '123'
    expect(@user).to_not be_valid
  end

  it 'Email should not be too short' do
    @user.email = 'b@r.c'
    expect(@user).to_not be_valid
  end

  it 'passwords should match' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    expect(@user).to_not be_valid
  end

  describe 'ActiveRecord Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
  end

  context 'ActiveRecord Associations' do
    it { should have_many(:attendances) }

    it { should have_many(:scheduled_events).through(:attendances) }
  end
end
