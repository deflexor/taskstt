# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_07_054510) do
  create_table "approvements", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.integer "task_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"user_id\", \"task_id\"", name: "index_approvements_on_user_id_and_task_id", unique: true
    t.index ["task_id_id"], name: "index_approvements_on_task_id_id"
    t.index ["user_id_id"], name: "index_approvements_on_user_id_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "status", default: "new"
    t.datetime "ends_at", precision: nil
    t.datetime "deadline_at", precision: nil
    t.datetime "canceled_at", precision: nil
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "approvements", "task_ids"
  add_foreign_key "approvements", "user_ids"
end
