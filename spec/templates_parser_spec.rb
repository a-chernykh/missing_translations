require 'spec_helper'
require 'templates_parser'

describe TemplatesParser do
  let(:templates) { ['spec/fixtures/template.erb', 'spec/fixtures/template.haml'] }

  subject { described_class.new templates }

  its(:keys) { should include 'en.fixtures.template.testing' }
  its(:keys) { should include 'en.fixtures.template.erb_translation' }
  its(:keys) { should include 'en.fixtures.template.whatever' }
  its(:keys) { should include 'en.fixtures.template.with_double_quotes' }
  its(:keys) { should include 'en.global_scoped' }
  its(:keys) { should include 'en.long_helper_name' }
  its(:keys) { should include 'en.multiple_occurences' }
  its(:keys) { should include 'en.on_the_same_string' }

  it 'does not includes keys with string interpolation' do
    subject.keys.each { |key| expect(key).not_to include 'interpolation' }
  end
end
