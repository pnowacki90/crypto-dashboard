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
    @symbol = params[:sym]
  end
end
