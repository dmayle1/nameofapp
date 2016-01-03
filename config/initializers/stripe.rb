if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_fWH5KJBVj3h5N8TkskFjegKJ',
    :secret_key => 'sk_test_ky4s87BbkPrNh7wRsWQrajqK'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]