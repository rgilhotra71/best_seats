class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :number
      t.string :row
      t.integer :column
      t.integer :status
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
    add_index :seats, :number
    add_index :seats, :status
  end
end
