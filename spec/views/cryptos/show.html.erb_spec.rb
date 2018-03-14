require 'rails_helper'

RSpec.describe "cryptos/show", type: :view do
  before(:each) do
    @crypto = assign(:crypto, Crypto.create!(
      :symbol => "Symbol",
      :user_id => 2,
      :cost_per => "9.99",
      :amount_owned => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Symbol/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
