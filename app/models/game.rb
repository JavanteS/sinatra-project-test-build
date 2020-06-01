class Game < ActiveRecord::Base
    belongs_to :user 
    validates :title, :genre, :platform,  presence: true  

end 