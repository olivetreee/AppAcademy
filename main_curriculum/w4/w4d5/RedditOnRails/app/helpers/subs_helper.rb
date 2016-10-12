module SubsHelper
  def moderator?(sub)
    current_user == sub.moderator
  end
end
