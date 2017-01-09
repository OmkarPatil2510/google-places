require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'

module Google
  module Places
    class Client
      include HTTParty

      base_uri "https://maps.googleapis.com/maps/api/place"

      attr_reader :api_key

      def initialize(api_key)
        @api_key = api_key
      end

      def place_autocomplete(input, options = {})
        options = options.with_indifferent_access
        self.class.get(
          "/autocomplete/json",
          { query: build_request_parameters(input, options) }
        )
      end

      private

        def build_request_parameters(input, options = {})
          required_params = { key: api_key, input: input }
          required_params.merge(options)
        end

    end
  end
end
