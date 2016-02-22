module Gearbox
  class Client
    attr_reader :configuration

    def initialize(options = nil)
      @configuration = nil

      unless options.nil?
        @configuration = Configuration.new(options)
        check_config_opts
      end
    end

    def check_config_opts
      if configuration.nil? || !configuration.valid?
        @configuration = nil
        raise Error::MissingConfigOptions
      else
        @configuration.freeze
      end
    end

    def configure
      raise Error::AlreadyConfigured unless @configuration.nil?

      @configuration = Configuration.new
      yield(@configuration)
      check_config_opts
    end

    def connection
      return @connection if instance_variable_defined?(:@connection)

      check_config_opts
      @connection = Faraday.new(@configuration.base_url) do |conn|
        faraday.adapter Faraday.default_adapter
        faraday.response :json
      end
    end
  end
end

#base_url = options[:base_url]
#@token = options[:token]
#@connection = Faraday.new(:url => base_url, :ssl => {verify: false}, :headers => {:Authorization => "Bearer #{@token}"}) do |faraday|
#  faraday.response :logger
#  faraday.adapter  Faraday.default_adapter
#  faraday.response :json
#end