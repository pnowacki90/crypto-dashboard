class HomeController < ApplicationController
  def index
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

  def about
  end

  def lookup
    api_connect
    @symbol = params[:sym]
    @symbol = coin_validation(@symbol)
  end
end
