class CreateTrainBids < ActiveRecord::Migration[6.1]
  def change
    create_table :train_bids do |t|
      t.string :status
      t.references :train, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
