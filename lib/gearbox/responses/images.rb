require 'gearbox/responses/base'
require 'gearbox/responses/models/images'

module Gearbox
  module Response
    class Images < Base

      attr_reader :items

      def initialize(obj)
        @items = parse(obj, Model::Images)
        #total_img_array = obj['items']
        #@items = obj
      end
    end
  end
end