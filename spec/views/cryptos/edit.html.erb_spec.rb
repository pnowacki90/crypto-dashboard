require 'rails_helper'

RSpec.describe "cryptos/edit", type: :view do
  before(:each) do
    @crypto = assign(:crypto, Crypto.create!(
      :symbol => "MyString",
      :user_id => 1,
      :cost_per => "9.99",
      :amount_owned => "9.99"
    ))
  end

  it "renders the edit crypto form" do
    render

    assert_select "form[action=?][method=?]", crypto_path(@crypto), "post" do

      assert_select "input[name=?]", "crypto[symbol]"

      assert_select "input[name=?]", "crypto[user_id]"

      assert_select "input[name=?]", "crypto[cost_per]"

      assert_select "input[name=?]", "crypto[amount_owned]"
    end
  end
end
