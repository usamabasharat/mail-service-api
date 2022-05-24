class CreateTrainAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :train_availabilities do |t|
      t.string :from, null: false
      t.string :to, null: false
      t.datetime :departure_time, null: false
      t.datetime :arrival_time, null: false
      t.references :train, null: false, foreign_key: true

      t.timestamps
    end
  end
end
