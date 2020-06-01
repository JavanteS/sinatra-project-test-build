class User < ActiveRecord::Base
    has_secure_password
    has_many :games 
    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true 


end 