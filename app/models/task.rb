class Task < ApplicationRecord
  paginates_per 3

  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :beginning_date, presence: true
  validates :ending_date, presence: true
end
