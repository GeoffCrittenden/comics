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

ActiveRecord::Schema.define(version: 2019_05_26_211055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", primary_key: "age_id", force: :cascade do |t|
    t.string "name", comment: "Name of age, e.g., Golden, Silver, Bronze, etc."
    t.date "start_date", comment: "Date that is universally accepted as the start of the age"
    t.date "end_date", comment: "Date that is universally accepted as the end of the age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ages_on_name", unique: true
    t.index ["start_date"], name: "index_ages_on_start_date", unique: true
  end

  create_table "certification_labels", primary_key: "certification_label_id", force: :cascade do |t|
    t.integer "certification_service_id"
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_service_id", "name"], name: "index_certification_labels_on_certification_service_id_and_name", unique: true
  end

  create_table "certification_services", primary_key: "certification_service_id", force: :cascade do |t|
    t.string "name", comment: "CGC, CBCS, PGX, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_certification_services_on_name", unique: true
  end

  create_table "certifications", primary_key: "certification_id", force: :cascade do |t|
    t.integer "comic_book_id"
    t.integer "certification_service_id"
    t.integer "grade_id"
    t.integer "certification_label_id"
    t.integer "page_color_id"
    t.text "description", comment: "Anything noteworthy (i.e., first appearance, death of character, etc.)"
    t.text "grader_notes", comment: "explanatory notes justifying grade given"
    t.boolean "cbcs_checkmark", comment: "applies to CBCS only, used to denote a book that presents better than its grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comic_books", primary_key: "comic_book_id", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "certification_id"
    t.integer "purchase_id"
    t.integer "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contribution_types", primary_key: "contribution_type_id", force: :cascade do |t|
    t.string "name", comment: "Writer, cover artist, penciler, inks, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_contribution_types_on_name", unique: true
  end

  create_table "contributions", primary_key: "contribution_id", force: :cascade do |t|
    t.integer "contribution_type_id"
    t.integer "contributor_id"
    t.integer "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contribution_type_id", "contributor_id", "issue_id"], name: "contributions__u__contribution_type_id_contributor_id_issue_id", unique: true
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
    t.index ["edition_type"], name: "index_edition_types_on_edition_type", unique: true
  end

  create_table "grades", primary_key: "grade_id", force: :cascade do |t|
    t.string "grade", comment: "Numeric grade of the comic book"
    t.string "name", comment: "Text name of the grade (e.g., Very Fine, Near Mint, Good, etc.)"
    t.string "abbreviation", comment: "NM/MT, VG, F, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade", "name", "abbreviation"], name: "index_grades_on_grade_and_name_and_abbreviation", unique: true
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
    t.index ["title_id", "issue_number", "print_edition"], name: "index_issues_on_title_id_and_issue_number_and_print_edition", unique: true
  end

  create_table "page_colors", primary_key: "page_color_id", force: :cascade do |t|
    t.string "description", comment: "White, Off White, Off White to White, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_page_colors_on_description", unique: true
  end

  create_table "publishers", primary_key: "publisher_id", force: :cascade do |t|
    t.string "name", comment: "Universally recognized name of the publisher (e.g., Marvel or DC)"
    t.string "full_name", comment: "Official name of the publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publishers_on_name", unique: true
  end

  create_table "purchase_types", primary_key: "purchase_type_id", force: :cascade do |t|
    t.string "name", comment: "unique name, e.g., retail, convention, auction, etc."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_purchase_types_on_name", unique: true
  end

  create_table "purchases", primary_key: "purchase_id", force: :cascade do |t|
    t.integer "seller_id"
    t.integer "purchase_type_id"
    t.date "date", comment: "date of purchase"
    t.text "location", comment: "location of purchase, if different from seller address or website"
    t.boolean "online", comment: "if purchased online or not"
    t.decimal "price", precision: 7, scale: 2, comment: "price paid minus shipping costs"
    t.decimal "shipping_cost", precision: 5, scale: 2, comment: "cost to ship purchase, if applicable"
    t.text "notes", comment: "any other relevant info about the purcahse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", primary_key: "seller_id", force: :cascade do |t|
    t.string "name", comment: "business name"
    t.string "proprietor", comment: "full name of business owner, if applicable"
    t.text "address", comment: "street address of business, if applicable"
    t.string "website", comment: "online presence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sellers_on_name", unique: true
  end

  create_table "titles", primary_key: "title_id", force: :cascade do |t|
    t.integer "publisher_id"
    t.text "title", comment: "Offical title of print run from indicia"
    t.integer "volume", comment: "Vol. 1, Vol. 2, etc."
    t.integer "year_of_origin", comment: "Year of the first issue within the title and volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id", "title", "volume"], name: "index_titles_on_publisher_id_and_title_and_volume", unique: true
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

  add_foreign_key "certification_labels", "certification_services", primary_key: "certification_service_id"
  add_foreign_key "certifications", "certification_labels", primary_key: "certification_label_id"
  add_foreign_key "certifications", "certification_services", primary_key: "certification_service_id"
  add_foreign_key "certifications", "comic_books", primary_key: "comic_book_id"
  add_foreign_key "certifications", "grades", primary_key: "grade_id"
  add_foreign_key "certifications", "page_colors", primary_key: "page_color_id"
  add_foreign_key "comic_books", "certifications", primary_key: "certification_id"
  add_foreign_key "comic_books", "purchases", primary_key: "purchase_id"
  add_foreign_key "comic_books", "variants", primary_key: "variant_id"
  add_foreign_key "contributions", "contribution_types", primary_key: "contribution_type_id"
  add_foreign_key "contributions", "contributors", primary_key: "contributor_id"
  add_foreign_key "issues", "ages", primary_key: "age_id"
  add_foreign_key "issues", "titles", primary_key: "title_id"
  add_foreign_key "purchases", "purchase_types", primary_key: "purchase_type_id"
  add_foreign_key "purchases", "sellers", primary_key: "seller_id"
  add_foreign_key "titles", "publishers", primary_key: "publisher_id"
  add_foreign_key "variants", "edition_types", primary_key: "edition_type_id"
  add_foreign_key "variants", "issues", primary_key: "issue_id"
end
