# frozen_string_literal: true

# Event model
class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :event_date, presence: true
  scope :past, -> { where('event_date < :current_time', current_time: DateTime.now) }
  scope :upcoming, -> { where('event_date >= :current_time', current_time: DateTime.now) }

  def upcoming?
    Event.upcoming.include?(self)
  end
end
