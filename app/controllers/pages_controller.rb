class PagesController < ApplicationController
  
  before_action :deny_access, except: [:home,:pour,:stats]
  
  def home #public
  end
  
  def pour #public
    if request.post?      
      Rails.logger = Logger.new(STDOUT)

      @contact = Contact.find_by(numbeer_id: params["numbeer_id"])
      
      #check to see if ID is valid, if valid then register pour
      #if invalid, then let the user try again
      
      if @contact.nil?
        logger.debug("NOPE, TRY AGAIN")
      else
        logger.debug(@contact.first_name)
      end
      
    end
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
