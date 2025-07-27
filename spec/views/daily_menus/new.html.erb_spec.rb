require 'rails_helper'

RSpec.describe "daily_menus/new", type: :view do
  before(:each) do
    assign(:daily_menu, DailyMenu.new(date: Date.today))
  end

  it "renders new daily_menu form" do
    render
    assert_select "form[action=?][method=?]", daily_menus_path, "post" do
      assert_select "input[name=?]", "daily_menu[date]"
    end
  end
end
