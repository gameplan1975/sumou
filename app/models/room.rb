class Room < ApplicationRecord
    has_many :stations
    validates :name, presence: true
    validates :address, presence: true
    validates :age, presence: true
    #追加
    accepts_nested_attributes_for :stations, allow_destroy: true
end
