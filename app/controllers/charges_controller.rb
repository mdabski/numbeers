class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents
  @balance = Record.calculate_balance(current_user.id)
  @cc_amount = ((@balance + 1.00)*100).to_i

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
  
  redirect_to account_path

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to account_path
end
end
