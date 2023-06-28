require 'rails_helper'

RSpec.describe "wish_items/show", type: :view do
  before(:each) do
    @wish_item = assign(:wish_item, WishItem.create!(
      product: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
