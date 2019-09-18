 class Task<ApplicationRecord
    def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      order('id desc')
    end
  end
end