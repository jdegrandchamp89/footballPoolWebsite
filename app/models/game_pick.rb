class GamePick < ApplicationRecord
  validates :team1, :team2, :week, :pickedteam, :spread, :presence: true
end
