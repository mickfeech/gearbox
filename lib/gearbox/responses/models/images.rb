require 'gearbox/responses/base'
require 'gearbox/responses/models/image_items'

module Gearbox
  module Response
    module Model
      class Images < Response::Base

        attr_reader :kind, :items

        def initialize(obj)
          super(obj)
          @items = parse(@items, ImageItems)
        end
      end
    end

  end
end
