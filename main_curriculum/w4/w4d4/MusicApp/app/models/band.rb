# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums, dependent: :destroy

  has_many :tracks,
    through: :albums,
    source: :tracks

end
