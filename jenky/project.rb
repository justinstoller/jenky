module Jenky
  class Project
    attr_accessor :tag, :branch, :repo, :name

    def initialize payload
      @tag         = payload['ref'].match(/tags\/(.+)$/)[1]
      @branch      = tag.sub(/\d$/, 'x')
      @repo        = payload['repository']['name']
      @name        = "#{repo.capitalize} Compose (#{branch})"
    end
  end
end
