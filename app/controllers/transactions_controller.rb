class TransactionsController < ApplicationController
  
  def create #public
    #get a contact based on numbeer-id
    #if no contact, or invalid then redirect and show error about id
    #if valid then get the current keg on tap
    #if keg is active, meaning end_date is not set and there IS a keg
    #if no active keg then redirect and show error about keg
    #create a transaction object and save
    #if transcation is first pour of the day, send happy hour notice

    
      @transaction = Transaction.new
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