require 'JSON'
require 'YAML'
require 'gearbox/responses/images'

module Gearbox
  module Endpoint
    class Images
      PATH = '/oapi/v1/images'

      def initialize(client)
        @client = client
      end

      def images
        Response::Images.new(JSON.parse(images_request.body.to_json))
      end

      private

      def images_request
        result = @client.connection.get PATH
      end
    end
  end
end