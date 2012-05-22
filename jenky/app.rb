require 'rubygems' unless defined? Gem
require 'sinatra/base'
require 'rest_client'
require 'jenky/helpers'
require 'jenky/project'
require 'jenky/url'

module Jenky
  class App < Sinatra::Base
    enable :dump_errors, :logging
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :run, Proc.new { $0 == app_file }

    include Helpers

    before do
      ensure_github request
      @payload = extract_payload_from request
    end

    post '/' do
      halt unless @payload['ref'] =~ /refs\/tags/

      project           = Jenky::Project.new @payload
      cause             = Jenky::Cause.new @payload
      jenkins_url       = Jenky::Url.new project, cause
      jenkins_url.base  = 'https://jenkins.puppetlabs.com'
      jenkins_url.view  = 'Compose Builds'
      jenkins_url.token = 'MySuperSecretToken'

      RestClient.log = logger

      RestClient.get jenkins_url.to_url

    end
  end
end
