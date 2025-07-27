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

require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { should have_many(:ingredients) }
  it { should validate_presence_of(:name) }
end
