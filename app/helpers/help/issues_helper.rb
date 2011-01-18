module Help::IssuesHelper
  
  def posted_on_long(date)
    date.strftime("%B #{date.day.ordinalize} %Y") + " at " + date.strftime("%H:%M%p").downcase
  end
  
  def posted_on_short(date)
    date.strftime("%B #{date.day.ordinalize}, %Y %H:%M") + date.strftime("%p").downcase
  end
  
  def comment_by(comment)
    "staff" if comment.commenter_type == "User"
  end
  
end