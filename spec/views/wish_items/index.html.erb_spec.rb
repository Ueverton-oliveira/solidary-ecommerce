require 'rails_helper'

RSpec.describe "wish_items/index", type: :view do
  before(:each) do
    assign(:wish_items, [
      WishItem.create!(
        product: nil,
        user: nil
      ),
      WishItem.create!(
        product: nil,
        user: nil
      )
    ])
  end

  it "renders a list of wish_items" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
