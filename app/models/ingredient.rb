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


class Ingredient < ApplicationRecord
  belongs_to :menu_item
  validates :name, presence: true
end
