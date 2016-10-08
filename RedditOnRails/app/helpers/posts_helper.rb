module PostsHelper
  def author?(post)
    current_user == post.author
  end

  def other_subs(sub)
    Sub.all.reject { |each_sub| each_sub == sub }
  end

  def checked?(post, sub)
    "checked" if post.subs.include?(sub)
  end
end
