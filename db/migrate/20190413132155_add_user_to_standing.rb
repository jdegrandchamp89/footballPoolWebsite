class AddUserToStanding < ActiveRecord::Migration[5.2]
  def change
    add_reference :standings, :user, foreign_key: true
  end
end
