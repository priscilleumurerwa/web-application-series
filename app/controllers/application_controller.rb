class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
    def self.search(term)
        if term
          where('status LIKE ?', "%#{term}%").order('id DESC')
          where('priority LIKE ?', "%#{term}%").order('id DESC')
        else
          order('id DESC') 
        end
      end
end
