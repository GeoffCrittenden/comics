# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Publishers
Comics::CONFIG.publishers.each { |publisher| Publisher.find_or_create_by(publisher) }

# Edition Types
%w[Newsstand Direct].each { |edition_type| EditionType.find_or_create_by(edition_type: edition_type) }

# Ages
Comics::CONFIG.ages.each { |age| Age.find_or_create_by(age) }

# Contribution Types
Comics::CONFIG.contribution_types.each { |contribution_type| ContributionType.find_or_create_by(name: contribution_type) }

# Titles
Comics::CONFIG.titles.publishers.each do |publisher, titles|
  titles.each { |title| Title.find_or_create_by(title.merge(publisher: Publisher[publisher])) }
end

# Grades
Comics::CONFIG.grades.each { |grade| Grade.find_or_create_by(grade) }

# Certification Services and their Certification Labels
Comics::CONFIG.certification_services.each do |name, service_info|
  svc = CertificationService.find_or_create_by(name: name)
  service_info.labels.each { |label| CertificationLabel.find_or_create_by(label.merge(certification_service: svc)) }
end

# Page Colors
Comics::CONFIG.page_colors.each { |page_color| PageColor.find_or_create_by(page_color) }
