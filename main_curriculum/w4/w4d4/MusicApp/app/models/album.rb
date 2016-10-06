# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  album_type :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base

  ALBUM_TYPES = ["studio", "live", "mixed"]

  validates :name, :band_id, :album_type, null: false
  validates :album_type, inclusion: {in: ALBUM_TYPES}

  belongs_to :band

  has_many :tracks, dependent: :destroy
end
