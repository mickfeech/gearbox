require 'gearbox/responses/base'
require 'gearbox/responses/models/project_items'

module Gearbox
  module Response
    module Model
      class Projects < Response::Base

        attr_reader :items

        def initialize(obj)
          super(obj)
          @items = parse(@items, ProjectItems)
        end
      end
    end

  end
end
