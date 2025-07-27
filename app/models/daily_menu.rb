# == Schema Information
#
# Table name: daily_menus
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class DailyMenu < ApplicationRecord
  has_many :daily_menu_items, dependent: :destroy
  has_one :grocery_list, dependent: :destroy

  validates :date, presence: true
end
