require 'gearbox/responses/base'

module Gearbox
  module Response
    module Model
      class DockerImageManifest < Response::Base

        attr_reader :name, :tag, :architecture

        def initialize(obj)
          obj_hash = JSON(obj)
          super(obj_hash)
        end
      end
    end

  end
end
