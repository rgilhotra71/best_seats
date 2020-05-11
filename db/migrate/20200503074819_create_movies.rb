class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :summary
      t.string :year
      t.string :genre
      t.text :imdb_link
      t.integer :rows
      t.integer :columns

      t.timestamps
    end
  end
end
