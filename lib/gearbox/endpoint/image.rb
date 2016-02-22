require 'json'
require 'YAML'
require 'gearbox/responses/image'

module Gearbox
  module Endpoint
    class Image
      PATH = '/oapi/v1/images'

      def initialize(client)
        @client = client
      end



    end
  end
end