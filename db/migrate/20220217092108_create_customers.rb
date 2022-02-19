class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :image_id
      t.string :first_name
      t.string :last_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :password
      t.string :image
      t.string :infomation

       t.timestamps
    end
  end
end
