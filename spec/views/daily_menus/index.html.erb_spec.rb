require 'rails_helper'

RSpec.describe "daily_menus/index", type: :view do
  before(:each) do
    assign(:daily_menus, [
      create(:daily_menu, date: Date.today),
      create(:daily_menu, date: Date.tomorrow)
    ])
  end

  it "renders a list of daily_menus" do
    render
    assert_select "table tbody tr", count: 2
    assert_select "table tbody tr td", text: Date.today.to_s, count: 1
    assert_select "table tbody tr td", text: Date.tomorrow.to_s, count: 1
  end
end
