class PaginationService
    
    def initialize(collection, page: 1, per_page: 10)
        @collection = collection
        @page = page
        @per_page = per_page
    end

    def call
        @collection.page(@page).per(@per_page)
    end

end