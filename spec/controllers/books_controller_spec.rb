require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    describe "|- GET #index" do
        it "|- assigns all books as @books and renders them" do
            book = Book.create!(title: "Test Title", description: "Test Description", published_at: Date.today)
            get :index
            expect(assigns(:books)).to eq([book])
            expect(response).to be_successful
        end
    end

    describe "|- GET #show" do
        it "|- returns a specific book as @book" do
            book = Book.create!(title: "Unique Title", description: "Unique Description", published_at: Date.today)
            get :show, params: { id: book.id }
            expect(assigns(:book)).to eq(book)
            expect(response).to be_successful
        end
    end

    describe "|- POST #create" do
        context "|- with valid parameters" do
            let(:valid_attributes) { { title: "New Title", description: "New Description", published_at: Date.today } }
            
            it "|- creates a new book and returns the created status" do
                expect {
                    post :create, params: valid_attributes
                }.to change(Book, :count).by(1)
                expect(response).to have_http_status(:created)
            end
        end
    end

    describe "|- PATCH #publish" do
        let!(:book) { Book.create!(title: "Unpublished Book", description: "An awesome book", published_at: Date.today, published: false) }

        it "|- publishes the book" do
            patch :publish, params: { id: book.id }
            book.reload
            expect(book.published).to be true
            expect(response).to have_http_status(:ok)
        end
    end

end

