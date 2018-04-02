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

ActiveRecord::Schema.define(version: 20_180_401_155_726) do
  create_table 'blocks', force: :cascade do |t|
    t.integer  'page_id'
    t.integer  'weight'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'element_links', force: :cascade do |t|
    t.string  'title'
    t.string  'target'
    t.string  'img'
    t.text    'description'
    t.integer 'element_id'
  end

  create_table 'elements', force: :cascade do |t|
    t.integer  'weight'
    t.integer  'block_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pages', force: :cascade do |t|
    t.string   'path'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
