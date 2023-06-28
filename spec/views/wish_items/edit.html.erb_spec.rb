require 'rails_helper'

RSpec.describe "wish_items/edit", type: :view do
  before(:each) do
    @wish_item = assign(:wish_item, WishItem.create!(
      product: nil,
      user: nil
    ))
  end

  it "renders the edit wish_item form" do
    render

    assert_select "form[action=?][method=?]", wish_item_path(@wish_item), "post" do

      assert_select "input[name=?]", "wish_item[product_id]"

      assert_select "input[name=?]", "wish_item[user_id]"
    end
  end
end
