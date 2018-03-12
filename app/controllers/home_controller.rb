class HomeController < ApplicationController
  def index
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ['BTC', 'ETH', 'XRP', 'STEEM']
  end

  def about
  end

  def lookup
    index
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
