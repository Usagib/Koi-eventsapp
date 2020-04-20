# frozen_string_literal: true

module EventsHelper
  def upcoming?
    Event.upcoming.include?(self)
  end
end
