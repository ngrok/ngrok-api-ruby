# frozen_string_literal: true

module NgrokAPI
  class Client
    attr_reader :api_key,
      :base_url

    def initialize(
      api_key:,
      base_url: 'https://api.ngrok.com'
    )
      @api_key = api_key
      @base_url = base_url
    end

    def api_keys
      @_api_keys ||= NgrokAPI::Services::ApiKeysClient.new(client: self)
    end

    def endpoint_configurations
      @_endpoint_configurations ||= NgrokAPI::Services::EndpointConfigurationsClient.new(
        client: self
      )
    end

    def event_streams
      # @_event_streams ||= NgrokAPI::Services::EventStreamsClient.new(client: self)
    end

    def reserved_domains
      @_reserved_domains ||= NgrokAPI::Services::ReservedDomainsClient.new(client: self)
    end

    def tls_certificates
      @_tls_certificates ||= NgrokAPI::Services::TlsCertificatesClient.new(client: self)
    end

    def headers
      {
        'Authorization': "Bearer #{@api_key}",
        'Ngrok-Version': '2',
      }
    end

    def headers_with_json
      headers.merge({ 'Content-Type': 'application/json' })
    end

    def json_do(uri, req, data: nil)
      resp = Net::HTTP.start(uri.hostname, uri.port, req_options(uri)) do |http|
        http.request(req, data)
      end
      JSON.parse(resp.body) if resp.body
    end

    def req_options(uri)
      { use_ssl: uri.scheme == 'https' }
    end

    def url(path)
      path = path.delete_prefix(@base_url)
      "#{@base_url}#{path}"
    end

    def delete(path)
      uri = URI(url(path))
      req = Net::HTTP::Delete.new(uri, headers)
      json_do(uri, req)
    end

    def get(path, data: {})
      data = data != {} ? "?#{URI.encode_www_form(data)}" : ""
      uri = URI("#{url(path)}#{data}")
      req = Net::HTTP::Get.new(uri, headers)
      json_do(uri, req)
    end

    def patch(path, data: {})
      uri = URI(url(path))
      req = Net::HTTP::Patch.new(uri, headers_with_json)
      json_do(uri, req, data: data.to_json)
    end

    def post(path, data: {})
      uri = URI(url(path))
      req = Net::HTTP::Post.new(uri, headers_with_json)
      json_do(uri, req, data: data.to_json)
    end
  end
end
