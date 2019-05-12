class Issue < ApplicationRecord
  belongs_to :title
  belongs_to :age

  has_many :contributions
  has_many :contributors, through: :contributions
  has_many :variants

  validates :title_id, :issue_number, :year_of_publication, :month_of_publication, :print_edition, :age_id, presence: true

  validates :issue_number,  numericality: { only_integer: true, greater_than_or_equal_to: -10 }
  validates :print_edition, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :year_of_publication, format: {
    with:    /\A19[0-9][0-9]|200[0-9]|201[0-9]|202[0-9]\z/,
    message: 'must be a valid year between 1900 and 2029'
  }
  validates :month_of_publication, format: {
    with:    /\AJanuary|February|March|April|May|June|July|August|September|October|November|December\z/,
    message: 'please choose from January, February, March, April, May, June, July, August, September, October, November, December'
  }

  before_validation :populate_age

  def populate_age
    return if age_id?
    if date_of_publication? || (month_of_publication? && year_of_publication?)
      date = date_of_publication || "#{month_of_publication} #{year_of_publication}".to_date
      self.age_id = Age.determine_age_for_issue_date(date)
    end
  end
end
