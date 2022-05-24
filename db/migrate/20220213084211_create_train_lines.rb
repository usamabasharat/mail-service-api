class CreateTrainLines < ActiveRecord::Migration[6.1]
  def change
    create_table :train_lines do |t|
      t.string :status, default: 'unassigned', null: false
      t.references :train, null: false, foreign_key: true
      t.references :line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
