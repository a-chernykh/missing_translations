require 'spec_helper'
require 'rake_task'

module MissingTranslations
  describe RakeTask do
    describe '#search_files' do
      subject { described_class.new.search_files }

      it { should include 'app/**/*.haml' }
      it { should include 'app/**/*.erb' }
      it { should include 'app/**/*.slim' }
    end

    describe '#missing_keys' do
      let(:available_keys) { %w(key1 key2 key3) }
      let(:used_keys)      { %w(key1 key3 key4) }
      let(:parser)         { instance_double 'TemplatesParser', keys: used_keys }
      let(:yaml_contents)  { 'yaml contents' }

      it 'returns the difference between used keys and available keys' do
        allow(TemplatesParser).to receive(:new).and_return parser
        allow(HashKeysDumper).to receive(:dump).with(yaml_contents).and_return available_keys

        allow(Dir).to receive(:glob).and_call_original
        allow(Dir).to receive(:glob).with('config/locales/*.yml').and_return ['config/locales/en.yml']

        allow(subject).to receive(:read_yaml).with('config/locales/en.yml').and_return yaml_contents

        expect(subject.missing_keys).to eq %w(key4)
      end
    end
  end
end
