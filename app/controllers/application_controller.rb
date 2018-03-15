class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def api_connect
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

end
