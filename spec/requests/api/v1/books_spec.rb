require 'swagger_helper'

RSpec.describe 'Books API', type: :request do
  let!(:existing_book) { Book.create(title: "Old Title", description: "Old Description", published_at: Date.today) }
  let(:existing_book_id) { existing_book.id }
  let(:new_book_attributes) { { title: "New Book", description: "Description of the new book", published_at: Date.today.to_s } }

  shared_context '404 Not Found' do
    response '404', '|- book not found' do
      let(:id) { 'invalid' }
      let(:book) { {} }
      run_test!
    end
  end

  # Books Collection Operations
  path "/books" do
    # Retrieve all books, with optional filters for published status and pagination
    get "Retrieves all books, with optional filters for published status and pagination" do
      tags "Books"
      produces "application/json"
      parameter name: :published, in: :query, type: :boolean, required: false, description: 'Filter by published status'
      parameter name: :page, in: :query, type: :integer, required: false, description: "Page number"
      parameter name: :per_page, in: :query, type: :integer, required: false, description: "Number of books per page"

      response '200', '|- books found or filtered' do
        run_test!
      end

      response '200', '|- books array empty!' do
        before { Book.delete_all }
        run_test! do |response|
          expect(JSON.parse(response.body)).to be_empty
        end
      end
    end

    # Create a new book
    post "Creates a new book" do
      tags 'Books'
      consumes 'application/json'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          published_at: { type: :string, format: 'date' }
        },
        required: %w[title description published_at]
      }

      response '201', '|- book created' do
        let(:book) { new_book_attributes }
        run_test!
      end

      response '422', '|- invalid request' do
        let(:book) { { title: "" } }
        run_test!
      end
    end
  end

  # Additional Operations
  path '/books/search' do
    get 'Searches books by title' do
      tags 'Books'
      produces 'application/json'
      parameter name: :query, in: :query, type: :string, required: true, description: 'Search query for book titles'

      response '200', '|- books found' do
        let(:query) { 'Book' }
        run_test!
      end
    end
  end

  path '/books/published_in_year' do
    get 'Retrieves books published in a specific year' do
      tags 'Books'
      produces 'application/json'
      parameter name: :year, in: :query, type: :integer, required: true, description: 'Year of publication'

      response '200', '|- books found' do
        let(:year) { 2024 }
        run_test!
      end
    end
  end

  # Single Book Operations
  path '/books/{id}' do
    get 'Retrieves a single book' do
      tags 'Books'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, required: true, description: 'ID of the book to retrieve'

      response '200', '|- book found' do
        let(:id) { existing_book_id }
        run_test!
      end

      include_context '404 Not Found'
    end

    patch 'Updates a book with various attributes' do
      tags 'Books'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, required: true, description: 'ID of the book to update'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          published_at: { type: :string, format: 'date' },
          published: { type: :boolean }
        },
        required: %w[title description published_at]
      }

      response '200', '|- book updated' do
        let(:id) { existing_book_id }
        let(:book) { new_book_attributes }
        run_test!
      end

      include_context '404 Not Found'
    end

    path '/books/{id}/publish' do
      patch 'Publishes a book' do
        tags 'Books'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string, required: true, description: 'ID of the book to publish'
    
        response '200', '|- book published' do
          let(:id) { existing_book_id }
          run_test! do |response|
            expect(JSON.parse(response.body)['published']).to be(true)
          end
        end
    
        include_context '404 Not Found'
      end
    end

    delete 'Deletes a book' do
      tags 'Books'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, required: true, description: 'ID of the book to delete'

      response '204', '|- book deleted' do
        let(:id) { existing_book_id }
        run_test!
      end

      include_context '404 Not Found'
    end
  end
end
