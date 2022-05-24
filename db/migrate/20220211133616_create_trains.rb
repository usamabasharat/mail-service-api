class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.string :name, null: false
      t.float :maximum_weight, null: false
      t.float :maximum_volume, null: false
      t.float :cost, null: false
      t.string :status, default: 'not_booked'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
