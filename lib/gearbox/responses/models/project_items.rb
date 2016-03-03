require 'gearbox/responses/base'
require 'gearbox/responses/models/project_meta'

module Gearbox
  module Response
    module Model
      class ProjectItems < Response::Base

        attr_reader :metadata

        def initialize(obj)
          super(obj)
          @metadata = parse(@metadata, ProjectMetaData)
        end
      end
    end

  end
end
