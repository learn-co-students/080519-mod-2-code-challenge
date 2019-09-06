class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true

    def power_name=(powername)
        self.power.name = powername
    end

    def power_name
        self.power.name ? self.power.name : nil
    end
end
