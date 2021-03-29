class Beer < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews
    has_many :bars, through: :reviews
    has_many :beer_menus 
    belongs_to :brewery 

end
