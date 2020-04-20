# frozen_string_literal: true

# Adding attributes
class AddAtribbutesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :event_id, :integer
  end
end
