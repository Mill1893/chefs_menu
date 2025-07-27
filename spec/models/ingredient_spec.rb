# == Schema Information
#
# Table name: ingredients
#
#  id           :integer          not null, primary key
#  name         :string
#  quantity     :string
#  menu_item_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_ingredients_on_menu_item_id  (menu_item_id)
#

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { should belong_to(:menu_item) }
  it { should validate_presence_of(:name) }
end
