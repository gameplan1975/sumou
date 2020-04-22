class Station < ApplicationRecord
    blogs_to :room
    validates :line_name, presence: true
    validates :station_name, presence: true
    validates :walk_time, presence: true
end
