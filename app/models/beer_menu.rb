class BeerMenu < ApplicationRecord
    belongs_to :bar 
    belongs_to :beer  

    validates :beer_id, uniqueness: {scope: :bar_id}
end
