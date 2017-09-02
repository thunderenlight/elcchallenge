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

ActiveRecord::Schema.define(version: 20170902161828) do

  create_table "guides", force: :cascade do |t|
    t.integer  "standard_id"
    t.string   "student"
    t.string   "path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["standard_id"], name: "index_guides_on_standard_id"
  end

  create_table "standards", force: :cascade do |t|
    t.text     "domains"
    t.text     "tests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
