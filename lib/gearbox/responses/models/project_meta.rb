require 'gearbox/responses/base'

module Gearbox
  module Response
    module Model
      class ProjectMetaData < Response::Base

        attr_reader :name, :creationTimestamp

        def initialize(obj)
          obj_hash = JSON(obj)
          super(obj)

        end
      end
    end

  end
end
