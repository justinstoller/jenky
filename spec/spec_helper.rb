
Dir[File.join(File.dirname(__FILE__), '..', 'jenky', '*.rb')].each do |f|
  require f
end

require 'fakefs/safe'
require 'rack/test'
