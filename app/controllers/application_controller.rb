class ApplicationController < ActionController::Base
    def self.search(term)
        if term
          where('status LIKE ?', "%#{term}%").order('id DESC')
          where('priority LIKE ?', "%#{term}%").order('id DESC')
        else
          order('id DESC') 
        end
      end
end
