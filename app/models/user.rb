class User < ApplicationRecord
    validates :name, presence: true
    validates :user_type, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
    has_many :tasks 
    
    def self.admin
@users = User.all
  @admin = 0
  @users.each do |user|
    if user.user_type == "admin"
      @admin += 1
    end
  end
  return @admin
end
end