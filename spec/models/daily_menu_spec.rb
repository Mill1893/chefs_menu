# == Schema Information
#
# Table name: daily_menus
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe DailyMenu, type: :model do
  it { should have_many(:daily_menu_items) }
  it { should have_one(:grocery_list) }
end
