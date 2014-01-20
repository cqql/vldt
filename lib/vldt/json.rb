require "json"

module Vldt
  # JSON validations
  module JSON
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

    extend(self)
  end
end
