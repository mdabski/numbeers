class PagesController < ApplicationController
  
  before_action :deny_access, except: [:home,:pour,:stats]
  
  def home #public
  end
  
  def pour #public
  end
  
  def stats #public
  end
  
  def dashboard #admins
  end
  
  def about #public
  end
  
  def contact #public
    if request.post?
      name = params['name']
      email = params['email']
      message = params['message']
      
      #Send an email back to the visitor, as well as to admins with the visistors message
      UserMailer.contact_confirmation(email, name, message).deliver
      #AdminMailer.visitor_contact(email, name, message).deliver
      
      @success = true
    end
  end

end
