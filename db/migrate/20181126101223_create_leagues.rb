class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.integer :home_club
      t.integer :away_club
      t.string :score

      t.timestamps
    end
  end
end
