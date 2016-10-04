# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, uniqueness: { scope: :user_id }

  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
