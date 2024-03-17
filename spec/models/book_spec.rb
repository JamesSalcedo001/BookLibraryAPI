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

  context "Future Publication" do
    it "|- allows future published_at dates" do
      future_date_book = Book.new(title: "Future Book", description: "Future Description", published_at: Date.today + 1.year)
      expect(future_date_book).to be_valid
    end
  end

  describe "|- .search_by_title" do
    let!(:book1) { Book.create!(title: "Ruby on Rails", description: "A book about Rails", published_at: Date.today ) }
    let!(:book2) { Book.create!(title: "Ruby Programming", description: "A book about Ruby", published_at: Date.today ) }

    it "|- finds books that match the title query" do
      expect(Book.search_by_title("Rails")).to include(book1)
      expect(Book.search_by_title("Ruby")).to include(book2)
    end

    it "|- returns an empty result when no titles match" do
      expect(Book.search_by_title("Python")).to be_empty
    end
  end

  describe "|- #publish" do
    let(:book) { Book.create!(title: "Sample Book", description: "Sample Description", published_at: Date.today, published: false ) }

    it "|- sets published to true" do
      book.publish
      expect(book.reload.published).to eq(true)
    end
  end


end
