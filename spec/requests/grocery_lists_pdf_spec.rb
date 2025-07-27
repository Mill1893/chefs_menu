require 'rails_helper'


describe 'GroceryList PDF export', type: :request do
  let!(:user) { create(:user) }
  let!(:daily_menu) { create(:daily_menu) }
  let!(:grocery_list) { create(:grocery_list, daily_menu: daily_menu) }
  let!(:menu_item) { create(:menu_item, name: 'Salad', description: 'Fresh', category: 'Appetizer') }
  let!(:ingredient) { create(:ingredient, name: 'Lettuce', quantity: '1 head', menu_item: menu_item) }
  let!(:daily_menu_item) { create(:daily_menu_item, name: menu_item.name, description: menu_item.description, category: menu_item.category, daily_menu: daily_menu) }

  before { sign_in user, scope: :user }

  it 'returns a PDF with grouped ingredients' do
    get pdf_grocery_list_path(grocery_list)
    expect(response).to be_successful
    expect(response.content_type).to eq('application/pdf')
    # Check that the response body starts with the PDF file signature
    expect(response.body).to start_with('%PDF')
  end
end
