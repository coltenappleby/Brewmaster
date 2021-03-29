class BeerMenu < ApplicationRecord
    belongs_to :bar 
    belongs_to :beer  
end
