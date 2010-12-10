class Help::CommentsController < ApplicationController
  
  before_filter :login_required
    
  def create
    @comment = Comment.new(params[:comment].merge(:issue_id => params[:issue_id], :commenter_id => current_user.id, :commenter_type => "Contact"))
    if verify_recaptcha(:model => @comment, :private_key => Insight.configuration.recaptcha_private_key) && @comment.save
      redirect_to(help_issue_path(@comment.issue))
    else
      redirect_to(help_issue_path(@comment.issue))
    end
  end
  
end