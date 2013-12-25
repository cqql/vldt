module Vldt
  # Validates that the number is greater than or equal to a given one.
  class GreaterThanOrEqualTo < Chain
    def initialize (value)
      super(
        Number.new,
        Predicate.new(:greater_than_or_equal_to, { value: value }) { |o| o >= value })
    end
  end
end
