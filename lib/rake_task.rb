require 'templates_parser'
require 'hash_keys_dumper'
require 'yaml'

module MissingTranslations
  class RakeTask
    def missing_keys
      parser.keys - available_keys
    end

    def search_files
      %w(app/**/*.haml app/**/*.erb app/**/*.slim).freeze
    end

    private

    def available_keys
      Dir.glob('config/locales/*.yml').map { |locale| HashKeysDumper.dump(read_yaml(locale)) }.flatten
    end

    def read_yaml(file)
      YAML.load(File.read(file))
    end

    def parser
      @parser ||= TemplatesParser.new search_files.map { |mask| Dir.glob(mask) }.inject(:+)
    end
  end
end
