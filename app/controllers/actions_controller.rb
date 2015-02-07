class ActionsController < ApplicationController
  #before_action :deny_access
  
  def broadcast_message #admins
    subject = params['subject']
    message = params['message']
      
    #Send an email to all ACTIVE users
    #TODO: narrow to only confirmed users
    email_list = User.get_active_list
    UserMailer.broadcast_to_users(email_list, subject, message).deliver
    
    respond_to do |format|
      format.html { redirect_to(dashboard_path, :notice => 'Broadcast was successfully sent.')}
    end
  end
  
  def balance_notice #admins
    #Send a balance notice to all users who have an outstanding balance
    User.send_balance_notice
    
    respond_to do |format|
      format.html { redirect_to(dashboard_path, :notice => 'Balance Notice was successfully sent.')}
    end
  end
end