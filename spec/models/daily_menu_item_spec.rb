# == Schema Information
#
# Table name: daily_menu_items
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  category      :string
#  daily_menu_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_daily_menu_items_on_daily_menu_id  (daily_menu_id)
#

require 'rails_helper'

RSpec.describe DailyMenuItem, type: :model do
  it { should belong_to(:daily_menu) }
  it { should validate_presence_of(:name) }
end
