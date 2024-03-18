
class BooksController < ApplicationController
    # before_action :set_book, only: [:show, :update, :destroy, :publish]
    include SetResource


    # def index
    #     if params[:published].present?
    #         published_status = ActiveRecord::Type::Boolean.new.cast(params[:published])
    #         @books = Book.where(published: published_status)
    #     else
    #         @books = Book.all
    #     end

    #     @books = @books.order(:created_at).page(params[:page]).per(params[:per_page] || 10)

    #     render json: @books
    # end

    def index
        if params[:published].present?
            published_status = ActiveRecord::Type::Boolean.new.cast(params[:published])
            books = Book.where(published: published_status)
        else
            books = Book.all
        end
        @books = PaginationService.new(books, page: params[:page], per_page: params[:per_page]).call

        render json: @books
    end

    def show
        render json: @book
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book, status: :created
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def update
        if @book.update(book_params)
            render json: @book, status: :ok
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @book.destroy
    end


    # custom methods

    def search
        @books = Book.search_by_title(params[:query])
        render json: @books
    end

    def published_in_year
        year = params[:year].to_i
        year_range = Date.new(year)..Date.new(year).end_of_year

        @books = Book.published_in_year(year_range)
        render json: @books
    end


    def publish
        PublishBookService.new(@book).call

        if @book.errors.empty?
            render json: @book, status: :ok
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    # def publish
    #     if @book.publish
    #         render json: @book
    #     else
    #         render json: @book.errors, status: :unprocessable_entity
    #     end
    # end

    # def search
    #     @books = Book.where("title LIKE ?", "%#{params[:word_to_search]}%")
    #     render json: @books
    # end
    ## way to do it with controller instead of model


    private

    def book_params
        params.permit(:title, :description, :published_at, :published)
    end

    # def set_book
    #     @book = Book.find(params[:id])
    # end
end
