class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents
  @balance = Record.calculate_balance(current_user.id)
  @fee = @balance * 0.03 
  @cc_amount = ((@balance + @fee)*100).to_i

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @cc_amount,
    :description => 'NumBeers Payment',
    :currency    => 'cad'
  )
  
  #substract the amount paid from the user's account
  record_params = {contact_id: current_user.id, amount: (0-@balance), description: "Online Payment"}
  @record = Record.new(record_params)
  if @record.save
    redirect_to account_path, notice: 'Payment was successfull!'
  else
    redirect_to account_path, error: 'Error processing payment!'
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to account_path
end
end
