class Item < ApplicationRecord
    validates :title, presence: true
    validates :kind, presence: true
    validates :date, presence: true
end
