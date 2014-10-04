class PagesController < ApplicationController

  before_action :authenticate_http, only: [:pour]
  before_action :deny_access, except: [:home,:pour,:stats,:about,:contact]
  
  def home #public
  end
  
  def pour #public
    @keg = Keg.get_keg_on_tap
    @transaction = Transaction.new
    
    if request.post?  
      #check to see if ID is valid, if valid then register pour
      #if invalid, then let the user try again
      @contact = Contact.find_by(numbeer_id: params["numbeer_id"])
      if @contact.nil?
        respond_to do |format|
          format.html {redirect_to(pour_path, :alert => 'Invalid NumBeer ID, Try Again!')}
        end
      else
        @transaction.keg = @keg
        @transaction.contact = @contact
        
        respond_to do |format|
          if @transaction.save
            if Transaction.first_pour_of_day() == @transaction
              ApplicationHelper.send_happy_hour_notice()
            end
            
            format.html { redirect_to(pour_path, :notice => 'NumBeer was successfully recorded.')}
            format.json { render json: @transaction }
          else
            format.html { render :action => "new" }
            format.json { render json: @transaction.errors }
          end
        end
      end
    end
  end
  
  def stats #logged_in
    @keg = Keg.get_keg_on_tap
    @transactions = Transaction.all
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
