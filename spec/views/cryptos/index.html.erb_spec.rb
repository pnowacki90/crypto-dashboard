require 'rails_helper'

RSpec.describe "cryptos/index", type: :view do
  before(:each) do
    assign(:cryptos, [
      Crypto.create!(
        :symbol => "Symbol",
        :user_id => 2,
        :cost_per => "9.99",
        :amount_owned => "9.99"
      ),
      Crypto.create!(
        :symbol => "Symbol",
        :user_id => 2,
        :cost_per => "9.99",
        :amount_owned => "9.99"
      )
    ])
  end

  it "renders a list of cryptos" do
    render
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
