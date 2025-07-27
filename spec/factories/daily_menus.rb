# == Schema Information
#
# Table name: daily_menus
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :daily_menu do
    date { "2025-07-27" }
  end
end
