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
      for coin in @coins
        if @symbol == coin["symbol"]
          c = coin["symbol"]
        end
      end
      if @symbol != c
        @symbol = "Wrong symbol!"
      end
    end
  end
end
