class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :lab
      t.string :question_content
      t.string :question_title

      t.timestamps
    end
  end
end
