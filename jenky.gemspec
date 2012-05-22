Gem::Specification.new do |s|
  s.name        = 'jenky'
  s.version     = '0.1.0'
  s.authors     = [ 'Justin Stoller']
  s.email       = 'justin.stoller@gmail.com'
  s.summary     = 'Jenkins + Github'
  s.description = 'A little Sinatra server to manage Jenkins/Github interactions'

  s.require_paths = ['jenky']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'json'

  s.add_development_dependency 'rspec', '2.9.0'
  s.add_development_dependency 'fakefs'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'rack-test'
end
