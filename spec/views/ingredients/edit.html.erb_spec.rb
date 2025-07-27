require 'rails_helper'

RSpec.describe "ingredients/edit", type: :view do
  let(:ingredient) {
    menu_item = create(:menu_item)
    create(:ingredient, name: "MyString", quantity: "MyString", menu_item: menu_item)
  }

  before(:each) do
    assign(:ingredient, ingredient)
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredient_path(ingredient), "post" do

      assert_select "input[name=?]", "ingredient[name]"

      assert_select "input[name=?]", "ingredient[quantity]"

      assert_select "select[name=?]", "ingredient[menu_item_id]"
    end
  end
end
