class CreateMovieComments < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_comments do |t|
      t.integer :movie_id
      t.integer :customer_id
      t.float :rate, null: false, default: 0
      t.string :comment, null: false
      t.integer :gender
      t.integer :age

      t.timestamps
    end
  end
end
