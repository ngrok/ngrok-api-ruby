# frozen_string_literal: true

module NgrokAPI
  module Models
    class Location
      attr_reader :client,
        :attrs,
        :country_code,
        :latitude,
        :longitude,
        :lat_long_radius_km

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @country_code = @attrs['country_code']
        @latitude = @attrs['latitude']
        @longitude = @attrs['longitude']
        @lat_long_radius_km = @attrs['lat_long_radius_km']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
      end
    end
  end
end
