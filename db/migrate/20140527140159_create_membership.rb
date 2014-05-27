class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :game
      t.references :user
    end
  end
end
