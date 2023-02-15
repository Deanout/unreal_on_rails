class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.decimal :x
      t.decimal :y
      t.decimal :z

      t.timestamps
    end
  end
end
