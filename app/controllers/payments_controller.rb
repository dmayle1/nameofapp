class PaymentsController < ApplicationController
	def create
		@product = Prduct.find(params[:product_id])
		@user = current user
		token = params[:stripeToken]
		#Create a charge on the Stripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				:amount => 2000, #amount in cents, again
				:currency => "usd",
				:source => token,
				:description => params[:stripeEmail]
				)
			if charge.paid
				@order = Order.create(
					:product_id => @product.id,
					:user_id => current_user,
					:total => @product.price
					)
			end
		rescue Stripe::CardError => e 
			#The card has been declined
			body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  redirect_to product_path(product)
end
end
