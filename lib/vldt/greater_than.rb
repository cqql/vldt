module Vldt
  # Validates that object is greater than a given value.
  class GreaterThan < Predicate
    def initialize (value)
      super(:greater_than, { value: value }) { |o| o > value }
    end
  end
end
