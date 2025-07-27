require 'rails_helper'

RSpec.describe "daily_menu_items/index", type: :view do
  let!(:daily_menu) { create(:daily_menu) }
  before(:each) do
    assign(:daily_menu_items, [
      create(:daily_menu_item, name: "Name", description: "MyText", category: "Category", daily_menu: daily_menu),
      create(:daily_menu_item, name: "Name", description: "MyText", category: "Category", daily_menu: daily_menu)
    ])
  end

  it "renders a list of daily_menu_items" do
    render
    # Update selectors to match your view's structure if needed
    assert_select "table tbody tr", count: 2
    assert_select "table tbody tr td", text: "Name", count: 2
    assert_select "table tbody tr td", text: "MyText", count: 2
    assert_select "table tbody tr td", text: "Category", count: 2
  end
end
