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

ActiveRecord::Schema.define(version: 2022_03_17_195934) do

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "completed"
    t.date "started"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_features_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "image"
    t.date "started"
    t.text "description"
    t.text "ux"
    t.text "features_left_to_implement"
    t.text "current_features"
    t.text "acknowledgements"
    t.integer "features_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["features_id"], name: "index_projects_on_features_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "technology_type_id"
    t.index ["project_id"], name: "index_technologies_on_project_id"
    t.index ["technology_type_id"], name: "index_technologies_on_technology_type_id"
  end

  create_table "technology_groups", force: :cascade do |t|
    t.integer "technology_id"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_technology_groups_on_project_id"
    t.index ["technology_id"], name: "index_technology_groups_on_technology_id"
  end

  create_table "technology_types", force: :cascade do |t|
    t.integer "technologies_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technologies_id"], name: "index_technology_types_on_technologies_id"
  end

end