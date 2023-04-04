# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOAuthProvider
      attr_reader :client,
        :attrs,
        :github,
        :facebook,
        :microsoft,
        :google,
        :linkedin,
        :gitlab,
        :twitch,
        :amazon

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @github = @attrs['github']
        @facebook = @attrs['facebook']
        @microsoft = @attrs['microsoft']
        @google = @attrs['google']
        @linkedin = @attrs['linkedin']
        @gitlab = @attrs['gitlab']
        @twitch = @attrs['twitch']
        @amazon = @attrs['amazon']
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
