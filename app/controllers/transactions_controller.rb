class TransactionsController < ApplicationController
  
  def create #public
    #get a contact based on numbeer-id
    #if no contact, or invalid then redirect and show error about id
    #if valid then get the current keg on tap
    #if keg is active, meaning end_date is not set and there IS a keg
    #if no active keg then redirect and show error about keg
    #create a transaction object and save
    #if transcation is first pour of the day, send happy hour notice
    @keg = Keg.get_keg_on_tap
    if @keg.nil?
      redirect_to(pour_path, :alert => 'Keg is all dry, sorry about that!')
      return
    end
    
    #check to see if ID is valid, if valid then register pour
    #if invalid, then let the user try again
    @transaction = Transaction.new
    @transaction.keg = @keg
    @transaction.contact = Contact.find_by(numbeer_id: params["numbeer_id"])

    if @transaction.save
      ApplicationHelper.send_happy_hour_notice(@transaction)
      redirect_to(pour_path, :notice => 'NumBeer was successfully recorded.')
    else
      redirect_to(pour_path, :alert => 'Invalid NumBeer ID, Try Again!')
    end
  end
end