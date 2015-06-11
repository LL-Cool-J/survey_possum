class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :id
      t.integer :question_id
      t.integer :submission_id
      t.string :response

      t.timestamps null: false
    end
  end
end
