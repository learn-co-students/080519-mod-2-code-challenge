class Heroine < ApplicationRecord
    has_many :powers

    validates :name, uniqueness: true
end
