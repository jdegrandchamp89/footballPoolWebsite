class AddLeagueToStanding < ActiveRecord::Migration[5.2]
  def change
    add_reference :standings, :league, foreign_key: true
  end
end
