class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def api_connect
    require 'net/http'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

  def find_coin_data(coin_symbol1)
    c = @coins[1]
    for coin in @coins
      if coin_symbol1 == coin["symbol"]
        c = coin
        @name = c["name"]
        @rank = c["rank"]
        @price_usd = c["price_usd"]
      end
    end
  end

  def coin_validation(coin_symbol2)
    if coin_symbol2
      coin_symbol2 = coin_symbol2.upcase
      find_coin_data(coin_symbol2)
      if coin_symbol2 == ""
        coin_symbol2 = "You didn't write anything!"
      elsif coin_symbol2 != c["symbol"]
        coin_symbol2 = "Wrong symbol!"
      end
    end
    return coin_symbol2
  end
end
