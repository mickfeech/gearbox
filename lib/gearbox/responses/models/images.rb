require 'gearbox/responses/base'
require 'hashie'

module Gearbox
  module Response
    module Model
      class Images < Response::Base

        attr_reader :kind

        def initialize(obj)
          super(obj)
          #@items = Hashie::Mash.new obj
          #puts @items
          #sleep(30)
          #@items
        end
      end
    end

  end
end
