class Room < ApplicationRecord
    has_many :stations
    validates :name, presence: true
    validates :address, presence: true
    validates :age, presence: true
end
