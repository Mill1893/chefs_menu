require 'rails_helper'

RSpec.describe "daily_menu_items/edit", type: :view do
  let!(:daily_menu) { create(:daily_menu) }
  let(:daily_menu_item) {
    create(:daily_menu_item, name: "MyString", description: "MyText", category: "MyString", daily_menu: daily_menu)
  }

  before(:each) do
    assign(:daily_menu_item, daily_menu_item)
  end

  it "renders the edit daily_menu_item form" do
    render

    assert_select "form[action=?][method=?]", daily_menu_item_path(daily_menu_item), "post" do

      assert_select "input[name=?]", "daily_menu_item[name]"

      assert_select "textarea[name=?]", "daily_menu_item[description]"

      assert_select "input[name=?]", "daily_menu_item[category]"

      assert_select "select[name=?]", "daily_menu_item[daily_menu_id]"
    end
  end
end
