# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  track_type :string           not null
#  position   :integer          not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base

  TRACK_TYPES = ["regular", "bonus"]

  validates :name, :album_id, :track_type, null: false
  validates :track_type, inclusion: {in: TRACK_TYPES}

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes

end
