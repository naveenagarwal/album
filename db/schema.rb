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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130504140207) do

  create_table "folders", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "photos_count", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "folders", ["user_id"], :name => "index_folders_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "folder_id"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "photos", ["folder_id"], :name => "index_photos_on_folder_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "photo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["photo_id"], :name => "index_taggings_on_photo_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
