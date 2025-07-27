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


class MenuItem < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
end
