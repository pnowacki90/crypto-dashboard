class HomeController < ApplicationController
  def index
    api_connect
    @my_coins = ['BTC', 'ETH', 'XRP', 'STEEM']
  end

  def about
  end

  def lookup
    api_connect
    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
      c = @coins[1]
      for coin in @coins
        if @symbol == coin["symbol"]
          c = coin
          @rank = c["rank"]
          @price_usd = c["price_usd"]
        end
      end
      if @symbol == ""
        @symbol = "You didn't write anything!"
      elsif @symbol != c["symbol"]
        @symbol = "Wrong symbol!"
      end
    end
  end
end
