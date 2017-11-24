class UserMailer < ApplicationMailer
  default from: "peter.testuro@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'peter.testuro@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Berlin Bikes"
    mail(:to => user.email, :subject => "Welcome to #{@appname} !")
  end

#   def thank_you
#     @name = params[:name]
#     @email = params[:email]
#     @message = params[:message]
#     UserMailer.contact_form(@email, @name, @message).deliver_now
#     end

# def order_placed(user, product)
#       @user = user
#       @product = product
#       mail(:from => 'peter.testuro@gmail.com',
#           :to => user.email,
#           :subject => "Your order of the #{product.name} bike has been placed.")
#     end


end