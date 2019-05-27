class Age < ApplicationRecord
  has_many :issues

  validates :name, :start_date, presence: true
  validates :name, :start_date, uniqueness: true
  validates :end_date, presence: true, if: Proc.new { |a| Age.pluck(:start_date).any? { |date| date > a.start_date } }

  scope :current, ->{ where("start_date < '#{Date.today}' AND end_date IS NULL").first }

  def self.determine_age_for_issue_date(issue_date)
    if issue_date > Age.current.start_date
      current
    else
      first("start_date <= '#{issue_date}' AND end_date <= '#{issue_date}'")
    end
  end
end
