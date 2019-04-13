class GamePick < ApplicationRecord
  belongs_to :user
  
  validates :team1, :team2, :week, :pickedteam, :spread, :gamedatetime, presence: true
end
