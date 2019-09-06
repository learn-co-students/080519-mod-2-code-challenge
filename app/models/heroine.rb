class Heroine < ApplicationRecord
    validates :name, uniqueness: true
    belongs_to :power
end
