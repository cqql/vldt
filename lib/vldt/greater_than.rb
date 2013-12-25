module Vldt
  # Validates that object is greater than a given value.
  class GreaterThan < Chain
    def initialize (value)
      super(
        Number.new,
        Predicate.new(:greater_than, { value: value }) { |o| o > value })
    end
  end
end
