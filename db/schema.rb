# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_01_115317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "label_children", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "label_master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_master_id"], name: "index_label_children_on_label_master_id"
    t.index ["task_id"], name: "index_label_children_on_task_id"
  end

  create_table "label_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_label_masters_on_user_id"
  end

  create_table "reads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_reads_on_task_id"
    t.index ["user_id"], name: "index_reads_on_user_id"
  end

  create_table "table_groupusers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_table_groupusers_on_group_id"
    t.index ["user_id"], name: "index_table_groupusers_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "deadline", default: "2000-01-01", null: false
    t.integer "status", default: 0, null: false
    t.integer "priority", default: 0, null: false
    t.bigint "user_id"
    t.string "image"
    t.index ["content"], name: "index_tasks_on_content"
    t.index ["created_at"], name: "index_tasks_on_created_at"
    t.index ["deadline"], name: "index_tasks_on_deadline"
    t.index ["status"], name: "index_tasks_on_status"
    t.index ["title"], name: "index_tasks_on_title"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "permission", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  add_foreign_key "label_children", "label_masters"
  add_foreign_key "label_children", "tasks"
  add_foreign_key "label_masters", "users"
  add_foreign_key "reads", "tasks"
  add_foreign_key "reads", "users"
  add_foreign_key "table_groupusers", "groups"
  add_foreign_key "table_groupusers", "users"
  add_foreign_key "tasks", "users"
end
