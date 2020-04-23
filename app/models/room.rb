class Room < ApplicationRecord
    has_many :stations
    validates :name, presence: true
    validates :address, presence: true
    validates :age, presence: true
    #追加
    accepts_nested_attributes_for :stations,reject_if: :reject_blank_station, allow_destroy: true

    def reject_blank_station(attributes)
        exists = attributes[:id].present?
        empty = attributes[:line_name].blank?
        attributes.merge!(_destroy: 1) if exists && empty
        !exists && empty
    end
end
