require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      status: 1,
      total_amount: "9.99",
      payment_type: 1,
      email: "MyString",
      product: nil,
      user: nil,
      address: nil
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[total_amount]"

      assert_select "input[name=?]", "order[payment_type]"

      assert_select "input[name=?]", "order[email]"

      assert_select "input[name=?]", "order[product_id]"

      assert_select "input[name=?]", "order[user_id]"

      assert_select "input[name=?]", "order[address_id]"
    end
  end
end
