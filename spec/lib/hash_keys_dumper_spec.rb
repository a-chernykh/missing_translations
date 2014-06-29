require 'spec_helper'
require 'hash_keys_dumper'

module MissingTranslations
  describe HashKeysDumper do
    describe '.dump' do
      subject { described_class.dump(hash) }

      context 'leaf element' do
        let(:hash) { { key: 'value' } }
        it { should == ['key'] }
      end

      context '2-level hash' do
        let(:hash) { { level1: { level2: 'value' } } }
        it { should == ['level1.level2'] }
      end

      context '2-level hash with 2 branches' do
        let(:hash) { { level1: { level21: 'value1', level22: 'value2' } } }
        it { should == ['level1.level21', 'level1.level22'] }
      end

      context '3-level hash with 3 branches' do
        let(:hash) { { level1: { level21: 'val', level22: { level31: 'value1', level32: 'value2' } } } }
        it { should == ['level1.level21', 'level1.level22.level31', 'level1.level22.level32'] }
      end
    end
  end
end
