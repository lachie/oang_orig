# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090622091112) do

  create_table "electorates", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hansard", :force => true do |t|
    t.string   "parlinfo_url"
    t.datetime "transcribed_at"
    t.string   "section_identifier"
    t.integer  "parent_id"
    t.integer  "member_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "party_id"
    t.integer  "house_id"
    t.integer  "electorate_id"
    t.date     "entered_house"
    t.string   "entered_how"
    t.date     "exited_house"
    t.string   "exited_how"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "url"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.boolean  "current",    :default => false, :null => false
    t.integer  "member_id"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
