require 'rails_helper'

RSpec.describe "grocery_lists/index", type: :view do
  let!(:daily_menu) { create(:daily_menu) }
  before(:each) do
    assign(:grocery_lists, [
      create(:grocery_list, daily_menu: daily_menu),
      create(:grocery_list, daily_menu: daily_menu)
    ])
  end

  it "renders a list of grocery_lists" do
    render
    render
    assert_select "#grocery_lists > *", minimum: 2
    assert_select "#grocery_lists", /Show this grocery list/
  end
end
