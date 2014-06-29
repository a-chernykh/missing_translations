Gem::Specification.new do |s|
  s.name    = 'missing_translations'
  s.version = '1.1.0'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
 
  s.authors = ['Andrey Chernih']
  s.email   = 'andrey.chernih@gmail.com'

  s.files = %w(missing_translations.gemspec)
  s.files += Dir.glob('lib/**/*.rb')
  s.files += Dir.glob('spec/**/*')

  s.homepage      = 'http://github.com/andreychernih/missing_translations'
  s.licenses      = ['Apache 2.0']
  s.require_paths = %w(lib)
  s.summary       = 'Show missing I18n keys in Rails applications'
end
