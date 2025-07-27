require 'rails_helper'

RSpec.describe "menu_items/new", type: :view do
  before(:each) do
    assign(:menu_item, build(:menu_item, name: "MyString", description: "MyText", category: "MyString"))
  end

  it "renders new menu_item form" do
    render

    assert_select "form[action=?][method=?]", menu_items_path, "post" do

      assert_select "input[name=?]", "menu_item[name]"

      assert_select "textarea[name=?]", "menu_item[description]"

      assert_select "input[name=?]", "menu_item[category]"
    end
  end
end
