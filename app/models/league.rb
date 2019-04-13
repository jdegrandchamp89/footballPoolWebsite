class League < ApplicationRecord
  has_many :league_memberships
  has_many :standings
end
