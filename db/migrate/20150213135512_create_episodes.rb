class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :season_id
      t.integer :episode_no
      t.string :file_name
      t.boolean :watched

      t.timestamps null: false
    end
  end
end
