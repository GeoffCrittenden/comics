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

ActiveRecord::Schema.define(version: 2019_05_12_140636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", primary_key: "age_id", force: :cascade do |t|
    t.string "name", comment: "Name of age, e.g., Golden, Silver, Bronze, etc."
    t.date "start_date", comment: "Date that is universally accepted as the start of the age"
    t.date "end_date", comment: "Date that is universally accepted as the end of the age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contribution_types", primary_key: "contribution_type_id", force: :cascade do |t|
    t.string "name", comment: "Writer, cover artist, penciler, inks, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributions", primary_key: "contribution_id", force: :cascade do |t|
    t.integer "contribution_type_id"
    t.integer "contributor_id"
    t.integer "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", primary_key: "contributor_id", force: :cascade do |t|
    t.string "first_name", comment: "First name of contributor"
    t.string "middle_name", comment: "Middle name or initial of contributor"
    t.string "last_name", comment: "Last name of contributor"
    t.string "title", comment: "Sir, Dame, Mr., Ms., etc."
    t.string "suffix", comment: "Jr., Sr., III, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edition_types", primary_key: "edition_type_id", force: :cascade do |t|
    t.string "edition_type", comment: "Most commonly either newsstand or direct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", primary_key: "issue_id", force: :cascade do |t|
    t.integer "title_id"
    t.integer "age_id"
    t.integer "issue_number", comment: "Issue number, e.g., the 129 from Amazing Spider-Man 129"
    t.string "issue_title", comment: "The title given to the individual issue by the writers.  Not always given."
    t.integer "year_of_publication", comment: "Publication year listed in the indicia"
    t.integer "month_of_publication", comment: "Publication month listed in the indicia"
    t.date "date_of_publication", comment: "The actual date of public release, does not always match the indicia publication mon/year"
    t.integer "print_edition", comment: "The numbered print edition, unsually first, but popular issues have multiple print editions"
    t.decimal "cover_price", precision: 5, scale: 2, comment: "Cover price on the issue itself, not the purhcase price paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id", "issue_number", "print_edition"], name: "issues__u__title_id_issue_number_print_edition", unique: true
  end

  create_table "publishers", primary_key: "publisher_id", force: :cascade do |t|
    t.string "name", comment: "Universally recognized name of the publisher (e.g., Marvel or DC)"
    t.string "full_name", comment: "Official name of the publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", primary_key: "title_id", force: :cascade do |t|
    t.integer "publisher_id"
    t.text "title", comment: "Offical title of print run from indicia"
    t.integer "volume", comment: "Vol. 1, Vol. 2, etc."
    t.integer "year_of_origin", comment: "Year of the first issue within the title and volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variants", primary_key: "variant_id", force: :cascade do |t|
    t.integer "issue_id"
    t.string "variant_identifier", comment: "Usually designated as a letter, with the main variant being A and others being B thru Z"
    t.text "variant_description", comment: "Often used to denote the specific artist or other significant meaning for the variant"
    t.integer "edition_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id", "variant_identifier", "edition_type_id"], name: "variants__u__issue_id_variant_identifier_edition_type_id", unique: true
  end

  add_foreign_key "issues", "ages", primary_key: "age_id"
  add_foreign_key "issues", "titles", primary_key: "title_id"
  add_foreign_key "titles", "publishers", primary_key: "publisher_id"
  add_foreign_key "variants", "edition_types", primary_key: "edition_type_id"
  add_foreign_key "variants", "issues", primary_key: "issue_id"
end
