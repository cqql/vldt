require "date"

module Vldt
  module Date
    # Validate, that an object can be parsed as a date.
    def date
      Predicate.new(:date) do |o|
        begin
          ::Date.parse(o)

          true
        rescue TypeError, ArgumentError
          false
        end
      end
    end

    extend(self)
  end
end
