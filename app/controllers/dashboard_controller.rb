class DashboardController < ApplicationController
    def index
      @sells = Sell.all || Sell.none  # Ensures @sells is never nil
    end
    
  end