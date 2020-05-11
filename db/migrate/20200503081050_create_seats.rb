class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.string :number
      t.string :row
      t.integer :column
      t.integer :status, :default => 0
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
    add_index :seats, :number
    add_index :seats, :status
  end
end
