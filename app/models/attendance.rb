# frozen_string_literal: true

# Attendance association
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
