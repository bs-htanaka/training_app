class Task < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 75 }
    enum status: {未着手: 0, 進行中: 1, 完了: 2}
    enum priority: {低: 0, 中: 1, 高: 2}
end
