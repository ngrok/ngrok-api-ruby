# frozen_string_literal: true

module NgrokAPI
  ##
  # Low-level api client for communicating with Ngrok's HTTP API.
  # Use this object to instantiate your clients.
  class Client
    def initialize(
      api_key:,
      base_url: 'https://api.ngrok.com'
    )
      @client = NgrokAPI::HttpClient.new(api_key: api_key, base_url: base_url)
    end

    ##
    # Creates and returns an instance of a NgrokAPI::Services::ApiKeysClient
    #
    # @return [NgrokAPI::Services::ApiKeysClient]
    def api_keys
      @_api_keys ||= NgrokAPI::Services::ApiKeysClient.new(client: @client)
    end

    ##
    # Creates and returns an instance of a NgrokAPI::Services::EndpointConfigurationsClient
    #
    # @return [NgrokAPI::Services::EndpointConfigurationsClient]
    def endpoint_configurations
      @_endpoint_configurations ||= NgrokAPI::Services::EndpointConfigurationsClient.new(
        client: @client
      )
    end

    ##
    # Creates and returns an instance of a NgrokAPI::Services::ReservedDomainsClient
    #
    # @return [NgrokAPI::Services::ReservedDomainsClient]
    def reserved_domains
      @_reserved_domains ||= NgrokAPI::Services::ReservedDomainsClient.new(client: @client)
    end

    ##
    # Creates and returns an instance of a NgrokAPI::Services::TlsCertificatesClient
    #
    # @return [NgrokAPI::Services::TlsCertificatesClient]
    def tls_certificates
      @_tls_certificates ||= NgrokAPI::Services::TlsCertificatesClient.new(client: @client)
    end
  end
end
