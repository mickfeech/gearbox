require 'spec_helper'
require 'json'
describe Gearbox::Endpoint::Images do
  include_context 'shared configuration'

  let(:config_opts) { real_config_opts }
  let(:client) { Gearbox::Client.new(config_opts) }


  describe '#images' do
    it 'It queries the api' do
      #puts client.images.list.items
      puts client.images.list.items.kind
      sleep(5)
      expect(client.images.list.kind).to eql('ImageList')
    end

  end
end