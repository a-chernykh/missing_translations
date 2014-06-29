require 'hash_keys_dumper'
require 'templates_parser'

namespace :missing_translations do
  desc 'Shows I18n translation keys which are missing (according to view parsing)'
  task :show => :environment do
    parser = TemplatesParser.new Dir.glob('app/**/*.haml') + Dir.glob('app/**/*.erb') + Dir.glob('app/**/*.slim')
    used_keys = parser.keys

    keys = Dir.glob('config/locales/*.yml').map { |locale| HashKeysDumper.dump YAML.load(File.read(locale)) }
    available_keys = keys.flatten

    missing_keys = (used_keys - available_keys)

    if missing_keys.any?
      puts 'Missing translations'
      puts missing_keys
    else
      puts 'You have no missing translations'
    end
  end
end
