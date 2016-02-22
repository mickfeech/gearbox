require 'spec_helper'

describe Gearbox::Configuration do
  include_context 'shared configuration'

  let(:config_opts) { valid_config_opts }
  let(:configuration) { Gearbox::Configuration.new(config_opts) }

  describe '#initialize' do
    subject { configuration }

    Gearbox::Configuration::CONFIG_OPTS.each do |config_opt|
      its(config_opt) { should eql(config_opts[config_opt]) }
    end
  end

  describe '#config_opts' do
    subject { configuration.config_opts }
    it 'has config_opts' do
      expect(configuration.config_opts).to eql(config_opts)
    end
  end

  describe '#valid?' do
    subject { configuration.valid? }

    context 'when options are valid' do
      it { is_expected.to eql(true) }
    end

    context 'when options are not set' do
      let(:config_opts) { Hash.new }
      it { is_expected.to eql(false) }
    end

    context 'when an option is an empty string' do
      let(:config_opts) { valid_config_opts.merge(auth_token: '') }
      it { is_expected.to eql(false) }
    end

    context 'when an option is nil' do
      let(:config_opts) { valid_config_opts.merge(auth_token: nil)}
      it { is_expected.to eql(false)}
    end
  end

end