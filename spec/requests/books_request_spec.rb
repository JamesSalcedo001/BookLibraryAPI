require 'rails_helper'

RSpec.describe "Books", type: :request do

  describe "GET /books" do
    it "|- returns a success response" do
      get books_path
      expect(response).to be_successful
    end
  end

  describe "POST /books" do
    context "|- with valid parameters" do
      let(:valid_attributes) { { title: "New Book", description: "New Book Description", published_at: Date.today } }

      it "|- creates a new book and returns a success response" do
        expect {
          post books_path, params: valid_attributes
        }.to change(Book, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "|- with invalid parameters" do
      let(:invalid_attributes) { { title: "", description: "description", published_at: Date.today } }

      it "|- does not create a new book" do
        expect {
          post books_path, params: invalid_attributes
        }.not_to change(Book, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /books/:id" do
    it "|- deletes the book and returns no content status" do
      book = Book.create!(title: "Delete Me", description: "Delete Description", published_at: Date.today)
      expect {
        delete book_path(book)
      }.to change(Book, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "PATCH /books/:id/publish" do
    let!(:book) { Book.create(title: "Unpublished Book", description: "An awesome book", published_at: Date.today, published: true ) }

    it "|- publishes the book and returns success" do 
      patch publish_book_path(book)
      book.reload
      expect(book.published).to be true
      expect(response).to have_http_status(:ok)
    end
  end



end
