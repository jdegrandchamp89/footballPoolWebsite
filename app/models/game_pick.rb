class GamePick < ApplicationRecord
  validates :team1, :team2, :week, :pickedteam, :spread, :gamedatetime, :presence: true
end
