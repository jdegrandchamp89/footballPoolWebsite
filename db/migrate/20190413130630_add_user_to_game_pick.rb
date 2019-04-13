class AddUserToGamePick < ActiveRecord::Migration[5.2]
  def change
    add_reference :game_picks, :user, foreign_key: true
  end
end
