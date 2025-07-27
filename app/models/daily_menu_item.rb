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


class DailyMenuItem < ApplicationRecord
  belongs_to :daily_menu
  validates :name, presence: true
end
