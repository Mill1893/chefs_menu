require 'rails_helper'

RSpec.describe "menu_items/edit", type: :view do
  let(:menu_item) {
    create(:menu_item, name: "MyString", description: "MyText", category: "MyString")
  }

  before(:each) do
    assign(:menu_item, menu_item)
  end

  it "renders the edit menu_item form" do
    render

    assert_select "form[action=?][method=?]", menu_item_path(menu_item), "post" do

      assert_select "input[name=?]", "menu_item[name]"

      assert_select "textarea[name=?]", "menu_item[description]"

      assert_select "input[name=?]", "menu_item[category]"
    end
  end
end
