require 'gearbox/responses/base'
require 'gearbox/responses/models/docker_image_reference'

module Gearbox
  module Response
    module Model
      class ImageItems < Response::Base

        attr_reader

        def initialize(obj)
          super(obj)

        end
      end
    end

  end
end
