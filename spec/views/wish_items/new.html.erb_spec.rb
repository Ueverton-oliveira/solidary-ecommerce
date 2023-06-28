require 'rails_helper'

RSpec.describe "wish_items/new", type: :view do
  before(:each) do
    assign(:wish_item, WishItem.new(
      product: nil,
      user: nil
    ))
  end

  it "renders new wish_item form" do
    render

    assert_select "form[action=?][method=?]", wish_items_path, "post" do

      assert_select "input[name=?]", "wish_item[product_id]"

      assert_select "input[name=?]", "wish_item[user_id]"
    end
  end
end
