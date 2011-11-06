# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_change_locale'
  s.version     = '0.2.1'
  s.summary     = 'Easy locale change for Spree'
  s.description = 'Easy locale change for Spree'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'humancopy'
  s.email             = 'info@humancopy.net'
  s.homepage          = 'https://github.com/humancopy/spree-change-locale'
  # s.rubyforge_project = 'actionmailer'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 0.70.0'
  # s.add_dependency 'http_accept_language', '~> 1.0'
  s.add_development_dependency 'rspec-rails'
end

