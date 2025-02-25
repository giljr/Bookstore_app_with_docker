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
      @sell.sold_at ||= Time.current # Set sold_at if not provided
  
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
        book_id = params[:sell][:book_id]
      
        if book_id.blank?
          @sell = Sell.new(sell_params) # Initialize a new Sell object
          @sell.errors.add(:book_id, 'Please select a book.') # Add an error for blank book_id
          render :new, status: :unprocessable_entity and return # Render the form with errors
        end
      
        @book = Book.find_by(id: book_id)
      end
      
      
  
    def sell_params
      params.require(:sell).permit(:quantity)
    end
  end
  