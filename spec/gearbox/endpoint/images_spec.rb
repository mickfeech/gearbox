require 'spec_helper'
require 'json'

describe Gearbox::Endpoint::Images do
  include_context 'shared configuration'

  let(:config_opts) { real_config_opts }
  let(:client) { Gearbox::Client.new(config_opts) }


  describe '#images' do
    subject {
      VCR.use_cassette('images') do
        client.images
      end
    }

    it { is_expected.to be_a(Gearbox::Response::Images) }
    its('list.kind') { should eql('ImageList')}
    its('list.items.first.dockerImageMetadata.kind') { should eql('DockerImage')}
  end
end