class Goal < ActiveRecord::Base
  validates :user, :start_date, :title, presence: true
  belongs_to :user
  has_many :comments

  def toggle_complete
    self.completed = self.completed == 'false' ? "true" : "false"
    self.save
  end


end
