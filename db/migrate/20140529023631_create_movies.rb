class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.float :budget
      t.float :gross
      t.text :img_url
    end
  end
end
