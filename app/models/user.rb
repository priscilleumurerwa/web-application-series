class User < ApplicationRecord
    validates :name, presence: true
    validates :user_type, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
    has_many :tasks 
end
