require 'rails_helper'

RSpec.describe "cryptos/new", type: :view do
  before(:each) do
    assign(:crypto, Crypto.new(
      :symbol => "MyString",
      :user_id => 1,
      :cost_per => "9.99",
      :amount_owned => "9.99"
    ))
  end

  it "renders new crypto form" do
    render

    assert_select "form[action=?][method=?]", cryptos_path, "post" do

      assert_select "input[name=?]", "crypto[symbol]"

      assert_select "input[name=?]", "crypto[user_id]"

      assert_select "input[name=?]", "crypto[cost_per]"

      assert_select "input[name=?]", "crypto[amount_owned]"
    end
  end
end
