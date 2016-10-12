# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :string
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true
  validates :title, uniqueness: true

  has_many :posts,
    through: :post_subs,
    source: :post

  has_many :post_subs,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :PostSub

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

end
