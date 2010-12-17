class Help::CommentsController < InsightController
  
  # before_filter :login_required
  skip_before_filter :login_required
    
  def create
    @comment = Comment.new(params[:comment].merge(defaults))
    if verify_recaptcha(:model => @comment, :private_key => Insight.configuration.recaptcha_private_key) && @comment.save
      redirect_to(help_issue_path(@comment.issue.to_param))
    else
      redirect_to(help_issue_path(@comment.issue.to_param))
    end
  end
  
  protected
  
    def defaults
      { 
        :issue_id       => params[:issue_id]#, 
        # :commenter_id   => current_user.crm_id,
        # :commenter_type => "Contact"
      }
    end
  
end