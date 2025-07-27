require 'rails_helper'

RSpec.describe "daily_menu_items/show", type: :view do
  let!(:daily_menu) { create(:daily_menu) }
  before(:each) do
    assign(:daily_menu_item, create(:daily_menu_item, name: "Name", description: "MyText", category: "Category", daily_menu: daily_menu))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(//)
  end
end
