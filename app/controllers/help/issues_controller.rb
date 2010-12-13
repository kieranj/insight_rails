class Help::IssuesController < ApplicationController
  
  layout Insight.configuration.layout
  
  before_filter :login_required, :except => [ :index, :show ]
  
  def my
    @issues = Issue.get(:my, :crm_id => current_user.crm_id)
    render :action => "index"
  end
  
  def index
    if params[:category_id]
      @issues = Category.find(params[:category_id]).issues
    else
      @issues = Issue.find(:all, :params => { :contact_id => current_user.crm_id })
    end
  end
  
  def show
    @issue = Issue.find(params[:id])
  end
  
  def new
    @issue = Issue.new
  end
  
  def create
    @issue = Issue.new(params[:issue].merge(:contact_id => current_user.crm_id))
    if verify_recaptcha(:model => @issue, :private_key => Insight.configuration.recaptcha_private_key) && @issue.save
      redirect_to(help_issue_path(@issue))
    else
      render :action => "new"
    end
  end
  
  def edit
    @issue = Issue.find(params[:id])
  end
  
  def update
    @issue = Issue.find(params[:id])
    if verify_recaptcha(:model => @issue, :private_key => Insight.configuration.recaptcha_private_key) && @issue.update_attributes(params[:issue].merge(:contact_id => current_user.crm_id))
      redirect_to(help_issues_path)
    else
      render :action => "edit"
    end
  end
  
end