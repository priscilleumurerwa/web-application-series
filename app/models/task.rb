class Task < ApplicationRecord
  paginates_per 3
  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :beginning_date, presence: true
  validates :ending_date, presence: true
  enum priority: [:high, :medium, :low]
  #belongs_to:user
 def self.search(term)
    if term
        where("status or priority or ending_date LIKE ?", "%# {term}%").page params[:page].per_page(3)
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
