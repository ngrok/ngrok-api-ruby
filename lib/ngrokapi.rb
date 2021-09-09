# frozen_string_literal: true

require 'json'
require 'net/http'

Dir[File.join('.', 'lib', '**/*.rb')].each do |f|
  require f
end

module NgrokAPI
end
