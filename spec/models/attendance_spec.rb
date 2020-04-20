# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'ActiveRecord Associations' do
    it { should belong_to(:user) }

    it { should belong_to(:event) }
  end
end
