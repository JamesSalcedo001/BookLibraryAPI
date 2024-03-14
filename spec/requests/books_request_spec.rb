require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "|- returns a success response" do
      get books_path
      expect(response).to be_successful
    end
  end
end
