class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
    @event = Event.find(params[:format])
  end

  def create

    @event = Event.find(params[:format])
    #format permet d'appeler le .1 de l'url qui correspond au numéro de l'event
    Attendance.create(participant: current_user, event: @event, strip_customer_id: params[:stripeEmail])
    flash[:success] = "Congratulations! You just joined the event."
    redirect_to event_path(@event)

    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
 
  
end


