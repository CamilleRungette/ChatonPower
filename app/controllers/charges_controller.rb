class ChargesController < ApplicationController

	def new
		@items = User.find(current_user.id).cart.items
		@amount = 0	
		@items.each do |item| 
			@amount += item.price
		end 
	end

	def create
		@items = User.find(current_user.id).cart.items
		@amount = 0	
		@items.each do |item| 
			@amount += item.price
		end 

		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount.to_i*100,
			description: 'Rails Stripe customer',
			currency: 'eur',
		})


	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

end
