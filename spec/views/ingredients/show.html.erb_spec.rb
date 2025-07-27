require 'rails_helper'

RSpec.describe "ingredients/show", type: :view do
  before(:each) do
    menu_item = create(:menu_item)
    assign(:ingredient, create(:ingredient, name: "Name", quantity: "Quantity", menu_item: menu_item))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Quantity/)
    expect(rendered).to match(//)
  end
end
