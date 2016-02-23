require 'gearbox/responses/base'

module Gearbox
  module Response
    module Model
      class DockerImageMetaData < Response::Base

        attr_reader :kind

        def initialize(obj)
          super(obj)

        end
      end
    end

  end
end
