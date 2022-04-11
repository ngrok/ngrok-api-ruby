# ngrok API client library for Ruby

This library wraps the [ngrok HTTP API](https://ngrok.com/docs/api) to make it
easier to consume in Ruby.

## Installation

This library is published on [Rubygems](https://rubygems.org/gems/ngrok-api)

```ruby
gem install ngrok-api
```

## Documentation

A quickstart guide and a full API reference are included in the [ngrok Ruby API documentation](https://ruby-api.docs.ngrok.com)

## Quickstart

Please consult the [documentation](https://ruby-api.docs.ngrok.com) for additional examples.

```ruby
require 'ngrokapi'
client = NgrokAPI::Client.new(api_key: '<API KEY>')

# Get an instance of the api_keys client and list all API keys
keys_client = client.api_keys
keys_client.list

# Or set up an edge and backend with the ability to change your configuration later
edge = client.edges.https.create!(
  description: "A Ruby Created Edge",
  metadata: '{"client": "ruby"}',
  hostports: ["your-subdomain.ngrok.io:443"]
)

backend = client.backends.tunnel_group.create!(
  description: "A Ruby Created Backend",
  labels: {"client_example": "ruby"}
)

route = client.edges.https_routes.create!(
  edge_id: edge.id,
  match_type: "path_prefix",
  match: "/",
  description: "Root",
  backend: NgrokAPI::Models::EndpointBackendMutate.new(attrs: {"enabled": true, "backend_id": backend.id}),
  compression: NgrokAPI::Models::EndpointCompression.new(attrs: {"enabled": true})
)

client.edge_modules.https_edge_route_compression.replace!(
  edge_id: edge.id,
  id: route.id,
  a_module: NgrokAPI::Models::EndpointCompression.new(attrs: {"enabled": false})
)
```

## Local Documentation

Documentation can be generated with the command:

```ruby
bundle exec yard doc 'lib/**/*.rb'
```

This will generate documentation which can be viewed within the doc folder.

## Specs

Specs can be run with the command:

```ruby
bundle exec rake
```

This will generate a coverage report which can be viewed within the coverage folder.

## Rubocop

Rubocop can be run with the command:

```ruby
# Run rubocop on lib folder
bundle exec rubocop 'lib'

# Run rubcop on all files
bundle exec rubocop
```
