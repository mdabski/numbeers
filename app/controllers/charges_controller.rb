class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents
  @balance = Record.calculate_balance(current_user.id)
  @cc_amount = ((@balance + 1.00)*100).to_i

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @cc_amount,
    :description => 'NumBeers Payment',
    :currency    => 'cad'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
