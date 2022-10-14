# frozen_string_literal: true

class CreateVessels < ActiveRecord::Migration[7.0]
  def change
    create_table :vessels do |t|
      t.string :name, null: false
      t.integer :kg_weight_limit, null: false
      t.boolean :full, default: false, null: false
      t.datetime :departure, null: false

      t.timestamps
    end
  end
end
