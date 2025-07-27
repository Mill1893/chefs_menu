require 'rails_helper'

RSpec.describe "daily_menus/show", type: :view do
  before(:each) do
    assign(:daily_menu, create(:daily_menu, date: Date.today))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Date.today.to_s}/)
  end
end
