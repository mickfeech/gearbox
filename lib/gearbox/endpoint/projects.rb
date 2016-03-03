require 'gearbox/responses/projects'

module Gearbox
  module Endpoint
    class Projects
      PATH = '/oapi/v1/projects'

      def initialize(client)
        @client = client
      end

      def projects
        Response::Projects.new(JSON.parse(projects_request.body.to_json))
      end

      private

      def projects_request
        result = @client.connection.get PATH
      end
    end
  end
end