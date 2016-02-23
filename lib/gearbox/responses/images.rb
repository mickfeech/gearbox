require 'gearbox/responses/base'
require 'gearbox/responses/models/images'

module Gearbox
  module Response
    class Images < Base

      attr_reader :list

      def initialize(obj)
        @list = parse(obj, Model::Images)
      end
    end
  end
end


#  items = (connection.get '/oapi/v1/images').body['items']
#  dockerImageManifests = items.collect { |item| YAML.load(item['dockerImageManifest']) }
#  repos = dockerImageManifests.collect { |repo| repo['name'] }.uniq
#  registryRepositories = Hash.new
#  repos.each do |r|
#    registryRepositories[r] = Array.new
#    dockerImageManifests.each do |manifest|
#      if manifest['name'] == r
#        registryRepositories[r].push(manifest['tag'])
#      end
#    end
#    registryRepositories[r] = registryRepositories[r].uniq
#  end
#  registryRepositories