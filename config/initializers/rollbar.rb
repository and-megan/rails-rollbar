require 'byebug'
Rollbar.configure do |config|

  config.access_token = 'YOUR-SEVER-SIDE-ACESS-TOKEN'

  # Here we'll disable in 'test':
  if Rails.env.test?
    config.enabled = false
  end

  config.js_enabled = true
  config.js_options = {
    accessToken: "YOUR-CLIENT-SIDE-ACCESS-TOKEN",
    captureUncaught: true,
    payload: {
      environment: "rails-app-js"
    }
  }

  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env

  # exception level filters
  # config.exception_level_filters.merge!({
  #   'ActionController::RoutingError' => 'ignore',
  #   'ActiveRecord::RecordNotFound' => 'ignore'
  # })

  # transform hook

  # handler = proc do |options|
  #   payload_body = options[:payload]['data'][:body]
  #
  #   # if custom data was passed with description key, edit occurrence payload
  #   if description = payload_body[:message][:extra][:description]
  #     # hard code title
  #     payload_body[:title] = payload_body[:message][:body]
  #
  #     # fake an exception to show display
  #
  #
  #
  #     payload_body[]
  #     payload_body[:trace][:frames] = [description]
  #   end
  # end
  #
  # config.transform << handler

  # scrub fields
  # config.scrub_fields |= ['notes']
end
