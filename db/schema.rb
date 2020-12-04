
ActiveRecord::Schema.define(version: 20201021210501) do

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.text "answer_content"
    t.string "lab"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flashcards", force: :cascade do |t|
    t.string "front"
    t.string "back"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "user_id"
    t.string "lab"
    t.string "question_content"
    t.string "question_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
