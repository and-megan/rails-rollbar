Rollbar.configure do |config|


  config.access_token = '2edb0f4ced9c403aaca6a8de2196fa05'

  # Here we'll disable in 'test':
  if Rails.env.test?
    config.enabled = false
  end

  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env

  config.scrub_fields |= ['notes']
end
