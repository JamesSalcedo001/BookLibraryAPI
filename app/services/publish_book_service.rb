class PublishBookService
   
    def initialize(book)
        @book = book
    end

    def call
        @book.update(published: true)
    end

end