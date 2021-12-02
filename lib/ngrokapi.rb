# frozen_string_literal: true

require 'json'
require 'net/http'

Dir[File.join('.', 'lib', '**/*.rb')].sort.each do |f|
  require f
end

##
# The Module which contains the Ngrok API gem
module NgrokAPI
end
