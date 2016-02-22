require 'openshift/responses/base'
require 'openshift/responses/models/image'

module Openshift
  module Response
    class Image < Base
      attr_reader :image

      def initialize(json)
        @image = parse(json, Model::Image)
      end
    end
  end
end