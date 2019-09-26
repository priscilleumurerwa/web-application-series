class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #validates :name, :content, :status, :priority, presence: true
end
