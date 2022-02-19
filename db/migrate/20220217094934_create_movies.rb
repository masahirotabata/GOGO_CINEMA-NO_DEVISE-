class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.integer :customer_id
      t.integer :image_id
      t.string :detail
      t.string :image

      t.timestamps
    end
  end
end
