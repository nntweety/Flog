class CreateMyLists < ActiveRecord::Migration[5.2]
  def change
    create_table :my_lists do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :movie_title
      t.string :movie_poster

      t.timestamps
    end
  end
end
