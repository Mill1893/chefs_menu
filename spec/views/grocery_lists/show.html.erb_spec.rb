require 'rails_helper'

RSpec.describe "grocery_lists/show", type: :view do
  let!(:daily_menu) { create(:daily_menu) }
  before(:each) do
    assign(:grocery_list, create(:grocery_list, daily_menu: daily_menu))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{daily_menu.date.to_s}/)
  end
end
