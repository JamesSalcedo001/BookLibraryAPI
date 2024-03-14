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

end

