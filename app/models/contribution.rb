class Contribution < ApplicationRecord
  belongs_to :contributor
  belongs_to :contribution_type
  belongs_to :issue
  belongs_to :variant
end
