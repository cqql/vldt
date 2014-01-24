require "date"

module Vldt
  # Date validations.
  module Date
    # Validate, that an object can be parsed as a date.
    def date
      Predicate.new(:date) do |o|
        begin
          o.is_a?(::Date) or ::Date.parse(o)

          true
        rescue TypeError, ArgumentError
          false
        end
      end
    end

    # Validate, that a date is after (`>=`) `date`.
    def date_after (date)
      Predicate.new(:date_after, { date: date }) do |o|
        o >= date
      end
    end

    # Validate, that a date is after (`<=`) `date`.
    def date_before (date)
      Predicate.new(:date_before, { date: date }) do |o|
        o <= date
      end
    end

    # Validate, that a date is in an allowed range.
    def date_between (min, max)
      Predicate.new(:date_between, { min: min, max: max}) do |o|
        o >= min && o <= max
      end
    end

    # Validate an object after parsing it as a {::Date}.
    def with_date (validation)
      Common.chain(
        date,
        With.new(-> d { ::Date.parse(d) }, validation))
    end

    extend(self)
  end
end
