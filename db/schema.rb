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

ActiveRecord::Schema.define(version: 20161108152723) do

  create_table "about_menus", force: :cascade do |t|
    t.integer  "product_id",       limit: 4
    t.integer  "prod_category_id", limit: 4
    t.integer  "order",            limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.string   "img",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "news_translations", force: :cascade do |t|
    t.integer  "news_id",    limit: 4,     null: false
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
  end

  add_index "news_translations", ["locale"], name: "index_news_translations_on_locale", using: :btree
  add_index "news_translations", ["news_id"], name: "index_news_translations_on_news_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "product_id",      limit: 4
    t.integer  "show_product_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "prod_categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.boolean  "show_on_main"
    t.string   "image",        limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "prod_category_translations", force: :cascade do |t|
    t.integer  "prod_category_id", limit: 4,     null: false
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
  end

  add_index "prod_category_translations", ["locale"], name: "index_prod_category_translations_on_locale", using: :btree
  add_index "prod_category_translations", ["prod_category_id"], name: "index_prod_category_translations_on_prod_category_id", using: :btree

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id", limit: 4,     null: false
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.text     "props",      limit: 65535
  end

  add_index "product_translations", ["locale"], name: "index_product_translations_on_locale", using: :btree
  add_index "product_translations", ["product_id"], name: "index_product_translations_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "desc",             limit: 65535
    t.string   "img",              limit: 255
    t.integer  "price",            limit: 4
    t.integer  "quantity",         limit: 4
    t.text     "props",            limit: 65535
    t.integer  "prod_category_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "sertificates", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
