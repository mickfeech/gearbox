require 'gearbox/responses/base'
require 'gearbox/responses/models/projects'

module Gearbox
  module Response
    class Projects < Base

      attr_reader :list

      def initialize(obj)
        @list = parse(obj, Model::Projects)
      end
    end
  end
end