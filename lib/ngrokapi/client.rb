# frozen_string_literal: true

module NgrokAPI
  class Client
    attr_accessor :api_keys,
      :event_streams
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

    def event_streams
      # @_event_streams ||= NgrokAPI::Services::EventStreamsClient.new(client: self)
    end

    def headers
      {
        'Authorization': "Bearer #{@api_key}",
        'Ngrok-Version': '2',
      }
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
      response = Net::HTTP.start(uri.hostname, uri.port, req_options(uri)) do |http|
        http.delete(uri, headers)
      end
      response.code
    end

    def get(path, data: {})
      data = data != {} ? "?#{URI.encode_www_form(data)}" : ""
      uri = URI("#{url(path)}#{data}")
      response = Net::HTTP.get(uri, headers)
      JSON.parse(response)
    end

    def patch(path, data: {})
      uri = URI(url(path))
      response = Net::HTTP.start(uri.hostname, uri.port, req_options(uri)) do |http|
        http.patch(
          uri,
          data.to_json,
          headers.merge({ 'Content-Type': 'application/json' })
        )
      end
      JSON.parse(response.body)
    end

    def post(path, data: {})
      uri = URI(url(path))
      response = Net::HTTP.start(uri.hostname, uri.port, req_options(uri)) do |http|
        http.post(
          uri,
          data.to_json,
          headers.merge({ 'Content-Type': 'application/json' })
        )
      end
      JSON.parse(response.body)
    end
  end
end
