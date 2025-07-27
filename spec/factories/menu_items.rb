# == Schema Information
#
# Table name: menu_items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  category    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :menu_item do
    name { "MyString" }
    description { "MyText" }
    category { "MyString" }
  end
end
