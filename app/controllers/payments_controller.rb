class PaymentsController < ApplicationController
  
    def create
        token = params[:stripeToken]
        @product = Product.find(params[:product_id])
        @user = current_user

        begin
            charge = Stripe::Charge.create(
                amount: (@product.price*100).to_i,
                currency: "eur",
                source: token,
                description: params[:stripeEmail],
                receipt_email: @user.email
            )
          
            if charge.paid
                Order.create(
                    product_id: @product.id,
                    user_id: @user.id,
                    total: @product.price
                )
            end

    flash[:notice] = "Your payment was processed successfully"

        rescue Stripe::CardError => e
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end

        redirect_to product_path(@product)
    end
end