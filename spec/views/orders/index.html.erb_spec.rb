require 'rails_helper'

RSpec.describe "orders/index.html.erb", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        status: 2,
        total_amount: "9.99",
        payment_type: 3,
        email: "Email",
        product: nil,
        user: nil,
        address: nil
      ),
      Order.create!(
        status: 2,
        total_amount: "9.99",
        payment_type: 3,
        email: "Email",
        product: nil,
        user: nil,
        address: nil
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
