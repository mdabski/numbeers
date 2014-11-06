class PagesController < ApplicationController

  before_action :authenticate_http, only: [:pour]
  before_action :deny_access, except: [:home,:pour,:stats,:about,:contact]
  before_action :admin_access, only: [:dashboard]
  
  def home #public
  end
  
  def pour #public
    @keg = Keg.get_keg_on_tap
    
  end
  
  def stats #logged_in
    @keg = Keg.get_keg_on_tap
    @transactions = Transaction.all
  end
  
  def account #logged_in
    @records = Record.where(contact_id: current_user.id)
    @balance = Record.calculate_balance(current_user.id)
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
      
      #Send an email back to the visitor, as well as to admins with the visitors message
      UserMailer.contact_confirmation(email, name, message).deliver
      AdminMailer.visitor_contact(email, name, message).deliver
      
      @success = true
    end
  end

end
