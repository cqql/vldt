module Vldt
  # Validates that a number is less than or equal to a given one.
  class LessThanOrEqualTo < Chain
    def initialize (value)
      super(
        Number.new,
        Predicate.new(:less_than_or_equal_to, { value: value }) { |o| o <= value })
    end
  end
end
