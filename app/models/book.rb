class Book < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :published_at, presence: true
end
