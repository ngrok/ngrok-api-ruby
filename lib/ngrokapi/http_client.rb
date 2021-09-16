# frozen_string_literal: true

module NgrokAPI
  ##
  # Low-level api client for communicating with Ngrok's HTTP API using HTTP. You should not have
  # to use this class directly, but use the individual clients to make your API calls.
  class HttpClient
    attr_reader :api_key,
      :base_url

    def initialize(
      api_key:,
      base_url: 'https://api.ngrok.com'
    )
      @api_key = api_key
      @base_url = base_url
    end

    ##
    # Make a DELETE request to a given URI
    #
    # @param [string] path URL resource path
    # @return [nil]
    def delete(path)
      uri = get_uri(path)
      req = Net::HTTP::Delete.new(uri, headers)
      json_do(uri, req)
    end

    ##
    # Make a GET request to a given URI with optional data
    #
    # @param [string] path URL resource path
    # @param [hash] data hash which will be converted to query parameters or form data
    # @return [json] response body
    def get(path, data: {})
      uri = get_uri(path, data: data)
      req = Net::HTTP::Get.new(uri, headers)
      json_do(uri, req)
    end

    ##
    # Make a GET request
    #
    # @param [string] before_id URL resource path
    # @param [integer] limit URL resource path
    # @param [string] path resource path, mutually exclusive with url
    # @param [string] url Full URL of the resource, mutually exclusive with path
    # @return [json] response body
    def list(before_id: nil, limit: nil, path: nil, url: nil)
      if url
        get(url)
      else
        data = {}
        data[:before_id] = before_id if before_id
        data[:limit] = limit if limit
        get(path, data: data)
      end
    end

    ##
    # Make a PATCH request to a given URI with optional data
    #
    # @param [string] path URL resource path
    # @param [hash] data hash which will be converted to query parameters or form data
    # @return [json] response body
    def patch(path, data: {})
      uri = get_uri(path)
      req = Net::HTTP::Patch.new(uri, headers_with_json)
      json_do(uri, req, data: data.to_json)
    end

    ##
    # Make a POST request to a given URI with optional data
    #
    # @param [string] path URL resource path
    # @param [hash] data hash which will be converted to query parameters or form data
    # @return [json] response body
    def post(path, data: {})
      uri = get_uri(path)
      req = Net::HTTP::Post.new(uri, headers_with_json)
      json_do(uri, req, data: data.to_json)
    end

    private

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
      if resp.body && resp.body != ''
        JSON.parse(resp.body)
      end
    end

    def req_options(uri)
      { use_ssl: uri.scheme == 'https' }
    end

    def get_uri(path, data: nil)
      data = (!data.nil? && data != {}) ? "?#{URI.encode_www_form(data)}" : ""
      URI("#{url(path)}#{data}")
    end

    def url(path)
      path = path.delete_prefix(@base_url)
      "#{@base_url}#{path}"
    end
  end
end
