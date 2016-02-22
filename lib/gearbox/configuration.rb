module Gearbox
  class Configuration
    CONFIG_OPTS = [:auth_token, :base_url]
    attr_accessor *CONFIG_OPTS

    # Creates the configuration
    # @param [Hash] has containing configuration parameters and their values
    # @return [Configuration] a new configuration with the values from the from the config_hash set
    def initialize(config_hash = nil)
      if config_hash.is_a?(Hash)
        config_hash.each do |config_name, config_value|
          self.send("#{config_name}=",config_value)
        end
      end
    end

    # Returns a hash of configuration options and their values
    def config_opts
      CONFIG_OPTS.inject({}) do |config_hash, key|
        config_hash[key] = send(key)
        config_hash
      end
    end

    def valid?
      CONFIG_OPTS.none?{ |key| send(key).nil? || send(key).empty?}
    end
  end
end