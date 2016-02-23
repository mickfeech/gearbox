require 'gearbox/responses/base'
require 'gearbox/responses/models/images'

module Gearbox
  module Response
    class Images < Base

      attr_reader :list

      def initialize(obj)
        @list = parse(obj, Model::Images)
      end
    end
  end
end