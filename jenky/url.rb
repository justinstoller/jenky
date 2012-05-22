require 'uri'

module Jenky
  class Url
    attr_accessor :base, :view, :token, :project, :cause

    def initialize project, cause = false
      @base, @view, @token  = nil
      @project              = project
      @cause                = cause
    end

    def to_url
      base_url      = "#{@base}/view/#{@view}/job/#{@project.name}/build"
      jenkins_url   = "#{base_url}?TOKEN=#{@token}"
      jenkins_url  += "&cause=#{@cause.print}" if @cause
      URI.escape jenkins_url
    end
  end
end
