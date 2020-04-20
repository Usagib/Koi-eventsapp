# frozen_string_literal: true

# Migration
class CreateAtendances < ActiveRecord::Migration[5.2]
  def change
    create_table :atendances do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.timestamps
    end
  end
end
