class CommentGravatar
  
  # Bit of a hack as the issue_comment class is being ignored atm.
  
  def initialize(email)
    @email = email
  end

  include Gravtastic
  gravtastic :email
  
  def email
    @email
  end
  
end