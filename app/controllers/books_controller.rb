class BooksController < ApplicationController
    def new
        @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        end
      else
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('book_form', partial: 'form', locals: { book: @book })
          end
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def book_params
        params.expect(book: [ :name, :price ])
    end
end
