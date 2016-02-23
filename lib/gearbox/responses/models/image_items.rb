require 'gearbox/responses/base'
require 'gearbox/responses/models/docker_image_manifest'
require 'gearbox/responses/models/docker_image_meta_data'

module Gearbox
  module Response
    module Model
      class ImageItems < Response::Base

        attr_reader :dockerImageReference, :dockerImageMetadata, :dockerImageManifest

        def initialize(obj)
          super(obj)
          @dockerImageMetadata = parse(@dockerImageMetadata, DockerImageMetaData)
          @dockerImageManifest = parse(@dockerImageManifest, DockerImageManifest)
        end
      end
    end

  end
end
