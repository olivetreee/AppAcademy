# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :sub_id, :author_id, presence: true

  belongs_to :sub

  has_many :post_subs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :PostSub

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :comments

end
