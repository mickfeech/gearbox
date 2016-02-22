module Gearbox
  module Error
    class Base < StandardError
      def initialize(msg, error=nil)
      end
    end

    class AlreadyConfigured < Base
      def initialize(msg = 'Cannot be reconfigured.  Initialize a new ' + 'instance of Openshift::Client.', error=nil)
        super
      end
    end

    class MissingConfigOptions < Base
      def initialize(msg = 'You are missing a configuration option')
        super
      end
    end

  end
end