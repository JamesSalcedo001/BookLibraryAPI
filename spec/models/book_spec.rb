require 'rails_helper'

RSpec.describe Book, type: :model do
  context "Validations" do
    it "|- is invalid without a title" do
      book = Book.new(title: nil, description: "valid description", published_at: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end
  
    it "|- is invalid without a description" do
      book = Book.new(title: "valid title", description: nil, published_at: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:description]).to include("can't be blank")
    end
  
    it "|- is invalid without a publishing date" do
      book = Book.new(title: "valid title", description: "valid description", published_at: nil)
      expect(book).not_to be_valid
      expect(book.errors[:published_at]).to include("can't be blank")
    end
  end


  
  context "Uniqueness" do
    before do
      Book.create!(title: "Unique Title", description: "A Description", published_at: Date.today)
    end

    it "|- has a unique title" do
      book = Book.new(title: "Unique Title", description: "Another Description", published_at: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("has already been taken")
    end
  end
end
