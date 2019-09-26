class Task < ApplicationRecord
  paginates_per 3
  #belongs_to:user
  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :beginning_date, presence: true
  validates :ending_date, presence: true
end
