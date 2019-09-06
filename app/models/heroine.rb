class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def self.find_by_power(power)
        power_id = Power.find_by(name: power).id
        Heroine.all.where('power_id = ?', power_id)
    end
end
