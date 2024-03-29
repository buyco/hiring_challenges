# frozen_string_literal: true

class AddJtiToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string
    add_index :users, :jti
  end
end
