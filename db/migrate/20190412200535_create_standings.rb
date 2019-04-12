class CreateStandings < ActiveRecord::Migration[5.2]
  def change
    create_table :standings do |t|
      t.integer :place
      t.integer :score

      t.timestamps
    end
    add_index :standings, :place, unique: true
  end
end
