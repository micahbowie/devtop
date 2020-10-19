class CreateFlashcards < ActiveRecord::Migration[5.1]
  def change
    create_table :flashcards do |t|
      t.string :front
      t.string :back
      t.integer :user_id

      t.timestamps
    end
  end
end
