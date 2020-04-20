# frozen_string_literal: true

# Migration
class AddCreatoridAttendeeidToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :user_id, :integer
  end
end
