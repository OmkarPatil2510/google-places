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

      def query_autocomplete(input, options = {})
        options = options.with_indifferent_access
        self.class.get(
          "/queryautocomplete/json",
          { query: build_request_parameters(input, options) }
        )
      end

      def place_photos(photo_reference, options = {})
        options = options.with_indifferent_access
        self.class.get(
          "/photo",
          { query: build_photo_request_parameters(photo_reference, options) }
        )
      end

      def place_add(name, location, types, options = {})
        options = options.with_indifferent_access
        self.class.post(
          "/add/json",
          {
            query: { key: api_key },
            body: build_add_request_body(name, location, types, options)
          }
        )
      end

      def place_details(place_id, options = {})
        options = options.with_indifferent_access
        self.class.get(
          "/details/json",
          { query: build_details_request_parameters(place_id, options) }
        )
      end

      private

        def build_request_parameters(input, options = {})
          required_params = { key: api_key, input: input }
          required_params.merge(options)
        end

        def build_photo_request_parameters(photo_reference, options = {})
          required_params = { key: api_key, photoreference: photo_reference }
          required_params.merge(options)
        end

        def build_add_request_body(name, location, types, options = {})
          required_params = { name: name, location: location, types: types }
          required_params.merge(options).to_json
        end

        def build_details_request_parameters(place_id, options = {})
          required_params = { key: api_key, placeid: place_id }
          required_params.merge(options)
        end

    end
  end
end
