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

ActiveRecord::Schema.define(:version => 20130619134445) do

  create_table "blog_visits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "visit_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blog_visits", ["user_id"], :name => "index_blog_visits_on_user_id"
  add_index "blog_visits", ["visit_id"], :name => "index_blog_visits_on_visit_id"

  create_table "blog_votings", :force => true do |t|
    t.integer "direction"
    t.integer "user_id"
    t.integer "blog_id"
  end

  add_index "blog_votings", ["blog_id"], :name => "index_blog_votings_on_blog_id"
  add_index "blog_votings", ["user_id"], :name => "index_blog_votings_on_user_id"

  create_table "comment_votings", :force => true do |t|
    t.integer  "direction"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_votings", ["comment_id"], :name => "index_comment_votings_on_comment_id"
  add_index "comment_votings", ["user_id"], :name => "index_comment_votings_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "blogger_id"
  end

  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.string   "ip"
    t.string   "browser_agent"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
