require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET #lookup" do
    it "renders the lookup template" do
      get :lookup
      expect(response).to render_template("lookup")
    end
  end

  describe "POST lookup" do
    context "with valid symbol" do
      it "redirects to lookup page" do
        post :lookup
        expect(response).to redirect_to(:lookup)
      end

      it "sends details of wanted coin" do
        
      end
    end
  end

end
