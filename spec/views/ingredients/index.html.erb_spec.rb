require 'rails_helper'

RSpec.describe "ingredients/index", type: :view do

  let!(:menu_item) { create(:menu_item) }

  before(:each) do
    assign(:ingredients, [
      create(:ingredient, name: "Name", quantity: "Quantity", menu_item: menu_item),
      create(:ingredient, name: "Name", quantity: "Quantity", menu_item: menu_item)
    ])
  end

  it "renders a list of ingredients" do
    render
    assert_select "table tbody tr", count: 2
    assert_select "table tbody tr td", text: "Name", count: 2
    assert_select "table tbody tr td", text: "Quantity", count: 2
    assert_select "table tbody tr td", text: menu_item.name, count: 2
  end
end
