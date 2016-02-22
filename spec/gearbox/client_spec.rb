require 'spec_helper'

describe Gearbox::Client do
  include_context 'shared configuration'
  let(:client) { Gearbox::Client.new(config_opts) }
  let(:config_opts) { valid_config_opts }

  def configure_client_with_options(config_opts)
    client.configure do |config|
      config_opts.each { |key, value| config.send("#{key}=", value) }
    end
  end

  describe '#initialize' do
    subject { client }

    context 'with valid configuration' do
      its(:configuration) { should be_a(Gearbox::Configuration) }
      its(:configuration) { should be_frozen }

      it 'should not be reconfigurable' do
        expect { configure_client_with_options(valid_config_opts) }.to raise_error(Gearbox::Error::AlreadyConfigured)
      end
    end

    context 'with invalid configuration' do
      let(:config_opts) { invalid_config_opts }
      it 'should raise an error when configuration is invalid' do
        expect { client }.to raise_error(Gearbox::Error::MissingConfigOptions)
      end
    end
  end

  describe '#configure' do
    subject { client.configuration }
    let(:client) { Gearbox::Client.new }

    context 'with valid configuration options' do
      before { configure_client_with_options(config_opts) }

      it 'should set the configuration values' do
        valid_config_opts.each do |key, value|
          expect(client.configuration.send(key)).to eql(value)
        end
      end

      it 'should not be reconfigurable' do
        expect { configure_client_with_options(valid_config_opts) }.to raise_error(Gearbox::Error::AlreadyConfigured)
      end

      it 'should be of type Openshift::Configuration' do
        expect(client.configuration).to be_a(Gearbox::Configuration)
      end

      it 'should be frozen' do
        expect(client.configuration).to be_frozen
      end
    end

    context 'with invalid configuration' do
      it 'should raise an error' do
        expect { configure_client_with_options(invalid_config_opts) }.to raise_error(Gearbox::Error::MissingConfigOptions)
      end
    end
  end

  describe '#connection' do
    let(:client) { Gearbox::Client.new }

    context 'without configuration' do
      it 'should raise an error' do
        expect { client.connection }.to raise_error(Gearbox::Error::MissingConfigOptions)
      end
    end
  end

end