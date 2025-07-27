# == Schema Information
#
# Table name: grocery_lists
#
#  id            :integer          not null, primary key
#  daily_menu_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_grocery_lists_on_daily_menu_id  (daily_menu_id)
#

require 'rails_helper'

RSpec.describe GroceryList, type: :model do
  it { should belong_to(:daily_menu) }
end
