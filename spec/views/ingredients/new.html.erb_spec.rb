require 'rails_helper'

RSpec.describe "ingredients/new", type: :view do
  before(:each) do
    menu_item = create(:menu_item)
    assign(:ingredient, Ingredient.new(
      name: "MyString",
      quantity: "MyString",
      menu_item: menu_item
    ))
  end

  it "renders new ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredients_path, "post" do

      assert_select "input[name=?]", "ingredient[name]"

      assert_select "input[name=?]", "ingredient[quantity]"

      assert_select "select[name=?]", "ingredient[menu_item_id]"
    end
  end
end
