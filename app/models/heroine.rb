class Heroine < ApplicationRecord
    validates :super_name, uniqueness: true
    belongs_to :power

    #default index load method
    #this should give the full index of sups if no search params were given 
    #then search the term in powers to return sups with power
    def self.search(search)
        if search #if search term is given
            #match search term with power name
            find_power = Power.find(name: search)
            if find_power
                self.find_by(:power_id == find_power.id)
            else
                #test
                self.all
            end
        else #if no search term given, still display index so nothing breaks
            self.all
        end
    end
end
