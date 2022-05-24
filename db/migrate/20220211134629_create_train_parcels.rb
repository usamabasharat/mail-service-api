class CreateTrainParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :train_parcels do |t|
      t.string :status
      t.references :train, null: false, foreign_key: true
      t.references :parcel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
