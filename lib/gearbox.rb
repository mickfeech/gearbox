require 'gearbox/version'
require 'gearbox/client'


module Gearbox
  # Returns an initially un-configured instance of the client
  # @return [Client] an instance of the client
  #
  # @example Configuring and using the client
  #   Openshift.client.configure do |config|
  #     config.auth_token = 'abc'
  #     config.base_url = 'def'
  #   end

  def self.client
    @client ||= Gearbox::Client.new
  end
end