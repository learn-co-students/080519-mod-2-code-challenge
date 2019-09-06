class Power < ApplicationRecord
    has_many :heroines 
    def powername
        Power.name
    end
end
