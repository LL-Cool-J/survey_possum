class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
