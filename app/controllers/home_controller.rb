class HomeController < ApplicationController
  def index
    api_connect
  end

  def about
  end

  def lookup
    api_connect
    @symbol = params[:sym]
    @symbol = coin_validation(@symbol)
  end
end
