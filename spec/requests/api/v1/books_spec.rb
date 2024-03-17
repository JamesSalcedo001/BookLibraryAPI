require 'swagger_helper'

RSpec.describe 'Books API', type: :request do
  # Setup block for shared test data
  let!(:existing_book) { Book.create(title: "Old Title", description: "Old Description", published_at: Date.today) }
  let(:existing_book_id) { existing_book.id }
  let(:new_book_attributes) { { title: "New Book", description: "Description of the new book", published_at: Date.today.to_s } }

  # Shared context for handling not found scenarios
  shared_context '404 Not Found' do
    response '404', '|- book not found' do
      let(:id) { 'invalid' }
      let(:book) { {} }
      run_test!
    end
  end

  # BOOKS COLLECTION OPERATIONS
  # ---------------------------
  path "/books" do

    # GET /books - Retrieves all books
    get "Retrieves all books" do
      tags "Books"
      produces "application/json"

      # Test case for when books are found
      response '200', '|- books found' do
        run_test!
      end

      # Test case for when the books array is empty
      response '200', '|- books array empty!' do
        before { Book.delete_all }
        run_test! do |response|
          expect(JSON.parse(response.body)).to be_empty
        end
      end
    end

    # Test for filtering books by published status
    get "Retrieves published or unpublished books based on query parameter" do
      tags "Books"
      produces "application/json"
      # Parameter for filtering by published status
      parameter name: :published, in: :query, type: :boolean, required: false, description: 'Filter books by published status'

      # Test case for filtering by published status
      response '200', '|- filtered books by published status' do
        let!(:published_book) { Book.create(title: "Published Book", description: "A published book", published_at: Date.today, published: true) }
        let!(:unpublished_book) { Book.create(title: "Unpublished Book", description: "An unpublished book", published_at: Date.today, published: false) }
        let(:published) { true }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size).to eq(1)
          expect(data.first['title']).to eq("Published Book")
        end
      end
    end

    # Test for pagination
    get "Retrieves books with pagination" do
      tags "Books"
      produces "application/json"
      # Parameters for pagination
      parameter name: :page, in: :query, type: :integer, required: false, description: "Page number"
      parameter name: :per_page, in: :query, type: :integer, required: false, description: "Number of books per page"

      # Test case for pagination
      response '200', '|- paginated books' do
        before do
          15.times do |i|
            Book.create(title: "Book #{i}", description: "Description #{i}", published_at: Date.today)
          end
        end
        let(:page) { 2 }
        let(:per_page) { 5 }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size).to eq(5)
          expect(data.first["title"]).to eq("Book 4")
        end
      end
    end

    #  POST /books - Creates a new book
    post 'Creates a book' do
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

  # SINGLE BOOK OPERATIONS
  # ----------------------
  path '/books/{id}' do

    # GET /books/{id} - Retrieves a single book by ID
    get 'Retrieves a single book' do
      tags 'Books'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'ID of the book to retrieve'

      response '200', '|- book found' do
        let(:id) { existing_book_id }
        run_test!
      end

      include_context '404 Not Found'
    end

    # PATCH /books/{id} - Updates an existing book by ID
    patch 'Updates a book' do
      tags 'Books'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'ID of the book to update'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          published_at: { type: :string, format: 'date' }
        },
        required: %w[title description published_at]
      }

      response '200', '|- book updated' do
        let(:id) { existing_book_id }
        let(:book) { new_book_attributes }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['title']).to eq(new_book_attributes[:title])
          expect(data['description']).to eq(new_book_attributes[:description])
          expect(data['published_at']).to eq(new_book_attributes[:published_at])
        end
      end

      include_context '404 Not Found'
    end

    # DELETE /books/{id} - Deletes a book by ID
    delete 'Deletes a book' do
      tags 'Books'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'ID of the book to delete'

      response '204', '|- book deleted' do
        let(:id) { existing_book_id }
        run_test! do |response|
          expect(response.body).to be_empty
        end
      end

      include_context '404 Not Found'
    end
  end
end




