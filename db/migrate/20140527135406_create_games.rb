class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :groupname
      t.integer :max_members
      t.boolean :is_public, default: true
    end

    add_index :games, :groupname, unique: true
  end
end
