# frozen_string_literal: true

# Add attributes to Event
class AddAtribbutesToModel < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
    add_column :events, :description, :text
    add_column :events, :category, :string
    add_column :events, :location, :string
    add_column :events, :event_date, :date
    add_column :events, :event_picture, :string
  end
end
