require 'rails_helper'

RSpec.describe "menu_items/index", type: :view do
  before(:each) do
    assign(:menu_items, [
      create(:menu_item, name: "Name", description: "MyText", category: "Category"),
      create(:menu_item, name: "Name", description: "MyText", category: "Category")
    ])
  end

  it "renders a list of menu_items" do
    render
    assert_select "table tbody tr", count: 2
    assert_select "table tbody tr td", text: "Name", count: 2
    assert_select "table tbody tr td", text: "MyText", count: 2
    assert_select "table tbody tr td", text: "Category", count: 2
  end
end
