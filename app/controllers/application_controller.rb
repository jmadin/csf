class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  require 'csv'

  ### CHANGE FOR LOCAL USE
  before_filter :set_path
  def set_path
    @file_path = "/assets/"
    # @file_path = "http://acropora.bio.mq.edu.au/trimodal/"
    # @file_path = "http://montipora.local/trimodal/"
  end  

  # Before filters

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


  ### EXPORT DATASET

  def export
    send_data @dataset.data, 
      :type => 'text/csv; charset=iso-8859-1; header=present', 
      :disposition => "attachment; filename=dataset_#{Date.today.strftime('%Y%m%d')}.csv" 
  end

end
