# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160822122119) do

  create_table "artifacts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "version"
    t.text     "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "size"
    t.integer  "category"
    t.integer  "ticket_id"
  end

  add_index "artifacts", ["ticket_id"], name: "index_artifacts_on_ticket_id"

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ticket_id"
    t.integer  "user_id"
  end

  add_index "comments", ["ticket_id"], name: "index_comments_on_ticket_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "developers_projects", id: false, force: :cascade do |t|
    t.integer "project_id",   null: false
    t.integer "developer_id", null: false
  end

  add_index "developers_projects", ["project_id", "developer_id"], name: "index_developers_projects_on_project_id_and_developer_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "planned_completion_date"
    t.datetime "actual_completion_date"
    t.datetime "creation_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "manager_id"
    t.integer  "creator_id"
  end

  add_index "projects", ["creator_id"], name: "index_projects_on_creator_id"
  add_index "projects", ["manager_id"], name: "index_projects_on_manager_id"

  create_table "projects_tickets", id: false, force: :cascade do |t|
    t.integer "ticket_id",  null: false
    t.integer "project_id", null: false
  end

  add_index "projects_tickets", ["project_id", "ticket_id"], name: "index_projects_tickets_on_project_id_and_ticket_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "planned_completion_date"
    t.datetime "submission_date"
    t.string   "blog_url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "priority"
    t.integer  "state"
    t.integer  "category"
    t.integer  "owner_id"
  end

  add_index "tickets", ["owner_id"], name: "index_tickets_on_owner_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "type"
    t.string   "password_digest"
  end

end
