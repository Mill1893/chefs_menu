require 'rails_helper'

RSpec.describe "grocery_lists/edit", type: :view do
  let!(:daily_menu) { create(:daily_menu) }
  let(:grocery_list) {
    create(:grocery_list, daily_menu: daily_menu)
  }

  before(:each) do
    assign(:grocery_list, grocery_list)
  end

  it "renders the edit grocery_list form" do
    render

    assert_select "form[action=?][method=?]", grocery_list_path(grocery_list), "post" do

      assert_select "input[name=?]", "grocery_list[daily_menu_id]"
    end
  end
end
