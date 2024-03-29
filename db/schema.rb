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

ActiveRecord::Schema.define(version: 2023_07_17_162252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "descriptions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_descriptions_on_project_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "completed"
    t.date "started"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "body"
    t.string "link"
    t.boolean "highlighted"
    t.index ["project_id"], name: "index_features_on_project_id"
  end

  create_table "flash_card_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "colour", limit: 9
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_flash_card_categories_on_parent_id"
  end

  create_table "flash_cards", force: :cascade do |t|
    t.integer "correct", default: 0
    t.integer "incorrect", default: 0
    t.text "question"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "flash_card_category_id"
    t.string "title"
    t.index ["flash_card_category_id"], name: "index_flash_cards_on_flash_card_category_id"
  end

  create_table "package_groups", force: :cascade do |t|
    t.bigint "package_id"
    t.string "package_groupable_type"
    t.bigint "package_groupable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_groupable_type", "package_groupable_id"], name: "index_package_groups_on_package_groupable"
    t.index ["package_id"], name: "index_package_groups_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "link"
    t.bigint "technology_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technology_id"], name: "index_packages_on_technology_id"
  end

  create_table "plans", force: :cascade do |t|
    t.text "description"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["project_id"], name: "index_plans_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "logo"
    t.string "image"
    t.string "theme_colours"
    t.string "repo"
    t.date "started"
    t.text "description"
    t.text "ux"
    t.integer "order"
    t.bigint "features_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sub_title"
    t.boolean "visible", default: false
    t.string "github_commits_link"
    t.integer "commits"
    t.index ["features_id"], name: "index_projects_on_features_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "icon_high_res"
    t.text "description"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "technology_type_id"
    t.integer "order"
    t.index ["project_id"], name: "index_technologies_on_project_id"
    t.index ["technology_type_id"], name: "index_technologies_on_technology_type_id"
  end

  create_table "technology_groups", force: :cascade do |t|
    t.bigint "technology_id"
    t.string "technology_groupable_type"
    t.bigint "technology_groupable_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technology_groupable_type", "technology_groupable_id"], name: "index_technology_groups_on_technology_groupable"
    t.index ["technology_id"], name: "index_technology_groups_on_technology_id"
  end

  create_table "technology_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "flash_cards", "flash_card_categories"
end
