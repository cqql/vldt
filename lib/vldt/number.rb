module Vldt
  # Validates that object is a number.
  class Number < Predicate
    def initialize
      super(:number, {}) { |o| o.is_a?(Numeric) }
    end
  end
end
