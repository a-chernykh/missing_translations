require 'spec_helper'
require 'templates_parser'

module MissingTranslations
  describe TemplatesParser do
    let(:templates) { ['spec/fixtures/template.erb', 'spec/fixtures/template.haml'] }

    subject do
      silence_stream(STDOUT) do
        described_class.new(templates).keys
      end
    end

    it { should include 'en.fixtures.template.testing' }
    it { should include 'en.fixtures.template.erb_translation' }
    it { should include 'en.fixtures.template.whatever' }
    it { should include 'en.fixtures.template.with_double_quotes' }
    it { should include 'en.global_scoped' }
    it { should include 'en.long_helper_name' }
    it { should include 'en.multiple_occurences' }
    it { should include 'en.on_the_same_string' }

    it 'does not includes keys with string interpolation' do
      subject.each { |key| expect(key).not_to include 'interpolation' }
    end
  end
end
