require "json"

module Vldt
  # JSON validations
  module JSON
    # Validate, that an object is valid JSON.
    def json
      Predicate.new(:json) do |o|
        begin
          ::JSON.parse(o)

          true
        rescue TypeError, ::JSON::ParserError
          false
        end
      end
    end

    # Validate an object after parsing it as a JSON string.
    def with_json (validation)
      Common.chain(
        json,
        With.new(-> json { ::JSON.parse(json) }, validation))
    end

    extend(self)
  end
end
