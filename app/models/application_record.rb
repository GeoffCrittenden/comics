class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.[](record_name)
    if columns.map(&:name).include?('name')
      find_by(name: record_name)
    elsif columns.map(&:name).include?(name.underscore)
      find_by(name.underscore.to_sym => record_name)
    end
  end
end
