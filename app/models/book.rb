class Book < ApplicationRecord
    after_initialize :set_default_published, if: :new_record?
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :published_at, presence: true

    # class method to search by title
    # def self.search_by_title(query)
    #     where("title LIKE ?", "%#{query}%")
    # end

    #scope version
    scope :search_by_title, ->(query) { where("title LIKE ?", "%#{query}%") if query.present? }

    scope :published_in_year, ->(year_range) { where(published_at: year_range) }

    def set_default_published
        self.published ||= false
    end

    def publish
        update(published: true)
    end


end
