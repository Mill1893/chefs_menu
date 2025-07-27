require 'rails_helper'

RSpec.describe "menu_items/show", type: :view do
  before(:each) do
    assign(:menu_item, create(:menu_item, name: "Name", description: "MyText", category: "Category"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
  end
end
