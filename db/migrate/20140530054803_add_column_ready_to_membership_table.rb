class AddColumnReadyToMembershipTable < ActiveRecord::Migration
  def change
    add_column :memberships, :is_ready, :boolean, :default => false
  end
end
