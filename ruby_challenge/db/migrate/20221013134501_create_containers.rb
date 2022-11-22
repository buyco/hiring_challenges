class CreateContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :containers do |t|
      t.string :type, null: false
      t.string :size, null: false
      t.string :state, null: false
      t.references :vessel, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
