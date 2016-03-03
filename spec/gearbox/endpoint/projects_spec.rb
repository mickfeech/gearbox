require 'spec_helper'
require 'json'

describe Gearbox::Endpoint::Projects do
  include_context 'shared configuration'

  let(:config_opts) { real_config_opts }
  let(:client) { Gearbox::Client.new(config_opts) }


  describe '#projects' do
    subject {
      VCR.use_cassette('projects') do
        client.projects
      end
    }

    it { is_expected.to be_a(Gearbox::Response::Projects) }
    its('list.items.first.metadata.creationTimestamp') { should eql('2016-03-03T15:44:21Z')}
  end
end