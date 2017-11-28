if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_NaNeVMRf6Le6PDlivlaox2Cv',
    secret_key: 'sk_test_mmhEehzDPMgYYF16ngUAcrA5'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]