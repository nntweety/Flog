class CreateWrritenFlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :wrriten_flogs do |t|
      t.integer :user_id
      t.float :score
      t.text :review
      t.string :movie_title
      t.integer :movie_id
      t.string :movie_poster

      t.timestamps
    end
  end
end
