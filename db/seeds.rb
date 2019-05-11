# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Publishers
[
  { name: 'Marvel', full_name: 'Marvel Comics' },
  { name: 'DC',     full_name: 'DC Comics, Inc.' },
].each { |publisher_info| Publisher.find_or_create_by(publisher_info) }

# Edition Types
%w[Newsstand Direct].each { |edition_type| EditionType.find_or_create_by(edition_type: edition_type) }

# Ages
[
  { name: 'Platinum', start_date: '1897-01-01', end_date: '1937-12-31' },
  { name: 'Golden',   start_date: '1938-01-01', end_date: '1955-12-31' },
  { name: 'Silver',   start_date: '1956-01-01', end_date: '1969-12-31' },
  { name: 'Bronze',   start_date: '1970-01-01', end_date: '1985-12-31' },
  { name: 'Copper',   start_date: '1986-01-01', end_date: '1991-12-31' },
  { name: 'Modern',   start_date: '1992-01-01', end_date: nil }
].each { |age_info| Age.find_or_create_by(age_info) }

# Contribution Types
%w[
  writer
  cover_art
  pencils
  colors
  letters
  artist
  editor
  executive_editor
  editor_in_chief
  chief_creative_officer
  publisher
  executive_producer
].each { |contribution_type| ContributionType.find_or_create_by(name: contribution_type) }
