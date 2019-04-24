class UpdateUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :game_picks, [:team1, :team2, :week], unique: true
    remove_index :game_picks, :team1
    remove_index :game_picks, :team2
    remove_index :game_picks, :week
  end
end
