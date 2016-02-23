require 'faraday'
require 'faraday_middleware'

require 'gearbox/configuration'
require 'gearbox/error'
require 'gearbox/endpoint/images'

module Gearbox
  class Client
    REQUEST_CLASSES = [Gearbox::Endpoint::Images
    ]
    attr_reader :configuration

    def initialize(options = nil)
      @configuration = nil
      define_request_methods

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
      @connection = Faraday.new(@configuration.base_url, :ssl => {verify: false}, :headers => {:Authorization => "Bearer #{@configuration.auth_token}"}) do |conn|
        conn.adapter Faraday.default_adapter
        conn.response :json
      end
    end

    private

    # Iterates through each endpoint class and creates singleton methods
    # on the client that query those classes.
    def define_request_methods
      REQUEST_CLASSES.each do |request_class|
        endpoint_instance = request_class.new(self)
        create_methods_from_instance(endpoint_instance)
      end
    end

    # Loop through all of the endpoint class and create singleton methods
    # on the client that queries those classes.
    def create_methods_from_instance(instance)
      instance.public_methods(false).each do |method_name|
        add_method(instance, method_name)
      end
    end

    # Define the method on the client and send it to the endpoint instance
    # with args passed in
    def add_method(instance, method_name)
      define_singleton_method(method_name) do |*args|
        instance.public_send(method_name, *args)
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