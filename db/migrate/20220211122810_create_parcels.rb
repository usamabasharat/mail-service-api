class CreateParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :parcels do |t|
      t.float :weight, null: false
      t.float :volume, null: false
      t.string :shipping_address, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
