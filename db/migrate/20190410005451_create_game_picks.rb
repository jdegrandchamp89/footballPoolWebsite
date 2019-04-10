class CreateGamePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :game_picks do |t|
      t.string :team1
      t.string :team2
      t.integer :week
      t.string :pickedteam
      t.integer :spread

      t.timestamps
    end
    add_index :game_picks, :team1, unique: true
    add_index :game_picks, :team2, unique: true
    add_index :game_picks, :week, unique: true
  end
end
