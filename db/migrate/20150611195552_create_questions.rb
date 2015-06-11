class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.string :question_text
      t.string :question_info
      t.string :question_type
      t.boolean :required
      t.integer :order_number

      t.timestamps null: false
    end
  end
end
