class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :answer_content
      t.string :lab

      t.timestamps
    end
  end
end
