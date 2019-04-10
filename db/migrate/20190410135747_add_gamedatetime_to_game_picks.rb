class AddGamedatetimeToGamePicks < ActiveRecord::Migration[5.2]
  def change
    add_column :game_picks, :gamedatetime, :datetime
  end
end
