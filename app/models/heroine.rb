class Heroine < ApplicationRecord
    has_one :power
    belongs_to :power

    validates :name, uniqueness: true

end
