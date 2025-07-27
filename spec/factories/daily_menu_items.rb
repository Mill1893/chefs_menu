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

FactoryBot.define do
  factory :daily_menu_item do
    name { "MyString" }
    description { "MyText" }
    category { "MyString" }
    association :daily_menu
  end
end
