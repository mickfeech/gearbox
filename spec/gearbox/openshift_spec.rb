require 'spec_helper'

describe Gearbox do
  it 'has a version number' do
    expect(Gearbox::VERSION).not_to be nil
  end

  describe '#client' do
    subject { Gearbox.client}
    it 'has a class of Openshift::Client' do
      expect(Gearbox.client).to be_a(Gearbox::Client)
      expect(Gearbox.client.configuration).to be(nil)
    end
  end
end