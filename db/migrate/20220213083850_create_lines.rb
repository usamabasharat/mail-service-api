class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.string :to, null: false
      t.string :from, null: false
      t.string :status, null: false, default: 'available'

      t.timestamps
    end
  end
end
