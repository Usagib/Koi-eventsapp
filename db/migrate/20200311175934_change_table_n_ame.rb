# frozen_string_literal: true

# Migration
class ChangeTableNAme < ActiveRecord::Migration[5.2]
  def change
    rename_table :atendances, :attendances
  end
end
