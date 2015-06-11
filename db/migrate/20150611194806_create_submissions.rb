class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :id
      t.integer :survey_id

      t.timestamps null: false
    end
  end
end
