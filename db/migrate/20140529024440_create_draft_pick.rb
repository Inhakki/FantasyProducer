class CreateDraftPick < ActiveRecord::Migration
  def change
    create_table :draft_picks do |t|
      t.references :game
      t.references :movie
    end
  end
end
