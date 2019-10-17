class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
    def self.search(term)
        if term
          where('status LIKE ?', "%#{term}%").order('id DESC')
          where('priority LIKE ?', "%#{term}%").order('id ascending')
        else
          order('id DESC') 
        end
      end
      def authorize
        redirect_to new_session_url,alert:"not authorized"if current_user.nil?
      end
end
