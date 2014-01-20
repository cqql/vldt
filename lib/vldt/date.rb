require "date"

module Vldt
  module Date
    # Validate, that an object is an ISO8601 date.
    def iso8601_date
      Predicate.new(:iso8601_date, {}) do |o|
        begin
          ::Date.strptime(o, "%Y-%m-%d")

          true
        rescue TypeError, ArgumentError
          false
        end
      end
    end

    extend(self)
  end
end
