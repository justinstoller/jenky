require 'spec_helper'

ENV['RACK_ENV'] = 'test'

describe 'Jenky' do
  include Rack::Test::Methods

  def app
    Jenky::App
  end

  it 'does stuff' do
  end
end
