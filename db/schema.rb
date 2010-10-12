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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101011113528) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openid_associations", :force => true do |t|
    t.datetime "issued_at"
    t.integer  "lifetime"
    t.string   "assoc_type"
    t.text     "handle"
    t.text     "secret"
    t.string   "target"
    t.text     "server_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openid_nonces", :force => true do |t|
    t.integer  "timestamp"
    t.string   "salt"
    t.string   "target"
    t.text     "server_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.string   "review"
    t.string   "other"
    t.integer  "rating"
    t.string   "author"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "type_of_food"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "foursquare_id"
  end

end
