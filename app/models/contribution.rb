class Contribution < ApplicationRecord
  belongs_to :contributor
  belongs_to :contribution_type
  belongs_to :issue
  belongs_to :variant

  validates :contributor_id, :contribution_type_id, :issue_id, presence: true
  validates :variant_id, presence: true, if: :cover_artist?

  def cover_artist?
    contribution_type_id == ContributionType.find_by(name: 'cover_art').contribution_type_id
  end
end
