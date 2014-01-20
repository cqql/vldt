require "json"

module Vldt
  # JSON validations
  module JSON
    def self.json
      Predicate.new(:json) do |o|
        begin
          ::JSON.parse(o)

          true
        rescue TypeError, ::JSON::ParserError
          false
        end
      end
    end
  end
end
