require 'rubygems' unless defined? Gem
require 'json'

module Jenky
  module Helpers
    def extract_payload_from request
      data = JSON.parse request.body.read
      payload = data['payload']
      logger.debug "Payload is: #{payload.inspect}"
      halt unless payload
      payload
    end

    def ensure_github request
      fail_if_insecure request
      fail_unless_github_api request
    end

    def fail_if_insecure request
      unless request.secure?
        logger.error 'Connection is NOT secure'
        halt
      end
    end

    def fail_unless_github_api request
      unless request.referrer == 'api.github.com'
        logger.error 'Connection NOT received from api.github.com'
        logger.error "Connection received from #{request.referrer}"
        halt
      end
    end
  end
end
