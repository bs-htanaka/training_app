class Task < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 75 }
end
