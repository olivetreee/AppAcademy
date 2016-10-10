# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  validates :title, :url, :user, presence: true

  belongs_to :user
  has_many :comments
end
