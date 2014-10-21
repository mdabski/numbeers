class ActionsController < ApplicationController
  #before_action :deny_access
  
  def broadcast_message #admins
    subject = params['subject']
    message = params['message']
      
    #Send an email to all users
    #TODO: narrow to only confirmed users
    users = User.all
    email_list = users.map{|u| u[:email]}
    UserMailer.broadcast_to_users(email_list, subject, message).deliver
      
     respond_to do |format|
       format.html { redirect_to(dashboard_path, :notice => 'Broadcast was successfully sent.')}
     end
  end
end