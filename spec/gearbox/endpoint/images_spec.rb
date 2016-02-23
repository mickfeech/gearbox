require 'spec_helper'
require 'json'
describe Gearbox::Endpoint::Images do
  include_context 'shared configuration'

  let(:config_opts) { real_config_opts }
  let(:client) { Gearbox::Client.new(config_opts) }


  describe '#images' do
    it 'It queries the api' do
      expect(client.images.items.kind).to eql('ImageList')
      sleep(30)
    end

  end
end