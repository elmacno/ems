class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :file_name
      t.integer :moviedb_id
      t.boolean :watched

      t.timestamps null: false
    end
  end
end
