class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def api_connect
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

  def coin_validation(coin_symbol)
    if coin_symbol
      coin_symbol = coin_symbol.upcase
      c = @coins[1]
      for coin in @coins
        if coin_symbol == coin["symbol"]
          c = coin
          @rank = c["rank"]
          @price_usd = c["price_usd"]
        end
      end
      if coin_symbol == ""
        coin_symbol = "You didn't write anything!"
      elsif coin_symbol != c["symbol"]
        coin_symbol = "Wrong symbol!"
      end
    end
    return coin_symbol
  end
end
