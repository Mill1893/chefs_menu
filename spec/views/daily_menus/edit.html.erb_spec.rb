require 'rails_helper'

RSpec.describe "daily_menus/edit", type: :view do
  let(:daily_menu) {
    create(:daily_menu, date: Date.today)
  }

  before(:each) do
    assign(:daily_menu, daily_menu)
  end

  it "renders the edit daily_menu form" do
    render
    assert_select "form[action=?][method=?]", daily_menu_path(daily_menu), "post" do
      assert_select "input[name=?]", "daily_menu[date]"
    end
  end
end
