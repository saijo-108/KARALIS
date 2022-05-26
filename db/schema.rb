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

ActiveRecord::Schema.define(version: 20_220_523_090_457) do
  create_table 'group_users', charset: 'utf8mb3', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'group_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['group_id'], name: 'index_group_users_on_group_id'
    t.index ['user_id'], name: 'index_group_users_on_user_id'
  end

  create_table 'groups', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description'
    t.integer 'role', default: 1, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'list_groups', charset: 'utf8mb3', force: :cascade do |t|
    t.bigint 'list_id'
    t.bigint 'group_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['group_id'], name: 'index_list_groups_on_group_id'
    t.index ['list_id'], name: 'index_list_groups_on_list_id'
  end

  create_table 'lists', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'name', null: false
    t.date 'registration_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
  end

  create_table 'songs', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'song_title', null: false
    t.string 'artist'
    t.string 'preview'
    t.bigint 'user_id'
    t.bigint 'list_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0, null: false
    t.string 'image'
    t.index ['list_id'], name: 'index_songs_on_list_id'
    t.index ['user_id'], name: 'index_songs_on_user_id'
  end

  create_table 'users', charset: 'utf8mb3', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'group_users', 'groups'
  add_foreign_key 'group_users', 'users'
  add_foreign_key 'list_groups', 'groups'
  add_foreign_key 'list_groups', 'lists'
  add_foreign_key 'songs', 'lists'
  add_foreign_key 'songs', 'users'
end
