module Jenky
  class Cause
    attr_accessor :last_commit, :author, :tag, :format, :payload, :msg

    def initialize payload
      @payload      = payload
      @last_commit  = payload['head_commit']['message']
      @author       = payload['pusher']['name']
      @tag          = payload['ref'].match(/tags\/(.+)$/)[1]
      @msg          = ":author Pushed Tag ':tag', Last Commit: :last_commit"
      @format       = Proc.new {|msg| msg.gsub(/ /, '+') }
    end

    def set var, value
      instance_variable_set var, value
    end

    def print
      out = @msg.gsub(/:([a-z_]+)/) {|match| instance_variable_get("@#{match}") || match }
      @format.call out
    end
  end
end
