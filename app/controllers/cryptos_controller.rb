class CryptosController < ApplicationController
  before_action :set_crypto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, except: [:index, :new, :create]
  before_action :api_connect, except: [:destroy, :new]
  # GET /cryptos
  # GET /cryptos.json
  def index
    @cryptos = Crypto.all
    @profit = 0
  end

  # GET /cryptos/1
  # GET /cryptos/1.json
  def show
    find_coin_data(@crypto.symbol)
  end

  # GET /cryptos/new
  def new
    @crypto = Crypto.new
  end

  # GET /cryptos/1/edit
  def edit
    find_coin_data(@crypto.symbol)
  end

  # POST /cryptos
  # POST /cryptos.json
  def create
    @crypto = Crypto.new(crypto_params)
    symbol = coin_validation(@crypto.symbol)
    if symbol == @crypto.symbol.upcase
      respond_to do |format|
        if @crypto.save
          format.html { redirect_to @crypto, notice: 'Crypto was successfully created.' }
          format.json { render :show, status: :created, location: @crypto }
        else
          format.html { render :new }
          format.json { render json: @crypto.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:error] = symbol
      render action: 'new'
    end
  end

  # PATCH/PUT /cryptos/1
  # PATCH/PUT /cryptos/1.json
  def update
    respond_to do |format|
      if @crypto.update(crypto_params)
        format.html { redirect_to @crypto, notice: 'Crypto was successfully updated.' }
        format.json { render :show, status: :ok, location: @crypto }
      else
        format.html { render :edit }
        format.json { render json: @crypto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptos/1
  # DELETE /cryptos/1.json
  def destroy
    @crypto.destroy
    respond_to do |format|
      format.html { redirect_to cryptos_url, notice: 'Crypto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto
      @crypto = Crypto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crypto_params
      params.require(:crypto).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.cryptos.find_by(id: params[:id])
      redirect_to cryptos_path, notice: "Not authorized to edit this entry" if @correct.nil?
    end


end
