class Label < ApplicationRecord
  belongs_to :user

  validates :name, :details, presence: true
 has_many :tasks, through: :tasks_labels
 has_many :tasks_labels, dependent: :destroy

 accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
    a['label_id'].blank? }
 accepts_nested_attributes_for :tasks
 
end
