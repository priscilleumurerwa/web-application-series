class Task < ApplicationRecord
  paginates_per 3
  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :beginning_date, presence: true
  validates :ending_date, presence: true
  enum priority: [:high, :medium, :low]
  belongs_to:user

  has_many :tasks_labels, dependent: :destroy
  has_many :labels, through: :tasks_labels

  accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
   a['label_id'].blank? }
 accepts_nested_attributes_for :labels
 before_save do
   self.label.gsub!(/[\[\]\"]/,"") if attribute_present? ("label")
 end
  
 def self.search(term)
    if term
        where('name LIKE ?', "%#{term}%")
    elsif term1
        where('name LIKE ?', "%#{term1}%")   
    else
        order(' id asc')
    end
 end
 def self.order_list(sort_order)
    if sort_order == "ending_date"
        order(ending_date: :desc)
    elsif sort_order == "status"
        order(Status: :desc)
        elsif sort_order == "priority"
            order(priority: :asc)
        else
         order(created_at: :desc)
        end
    end
end
