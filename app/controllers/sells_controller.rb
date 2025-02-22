class SellsController < ApplicationController
    before_action :set_book, only: [:create]

    def show
        @sell = Sell.find(params[:id])
    end
    
    def new
        @sell = Sell.new
    end

    def create
        @sell = @book.sells.new(sell_params)
        if @sell.save
            respond_to do |format|
                format.turbo_stream
            end            
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def set_book
        @book = Book.find(params[:sell][:book_id])
    end

    def sell_params
        params.expect(sell: [ :quantity, :day ])
    end
end