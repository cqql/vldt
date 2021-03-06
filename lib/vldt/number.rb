module Vldt
  # Function for number validation.
  module Number
    # Validate, that object is a number.
    def number
      Predicate.new(:number, {}) { |o| o.is_a?(Numeric) }
    end

    # Validates that object is greater than a minimum.
    def greater_than (min)
      Predicate.new(:greater_than, { min: min }) { |o| o > min }
    end

    # Validates that the number is greater than or equal to a minimum.
    def greater_than_or_equal_to (min)
      Predicate.new(:greater_than_or_equal_to, { min: min }) { |o| o >= min }
    end

    # Validate that a number is less than a maximum.
    def less_than (max)
      Predicate.new(:less_than, { max: max }) { |o| o < max }
    end

    # Validates that a number is less than or equal to a maximum.
    def less_than_or_equal_to (max)
      Predicate.new(:less_than_or_equal_to, { max: max }) { |o| o <= max }
    end

    # Validates that a number is in a given range, boundaries included.
    def between (min, max)
      Predicate.new(:between, { min: min, max: max }) { |o| o >= min && o <= max }
    end

    # Validate, that object is an integer.
    def integer
      Predicate.new(:integer, {}) { |o| o.is_a?(Integer) }
    end

    # Validate, that a number is odd.
    def odd
      Predicate.new(:odd, {}, &:odd?)
    end

    # Validate, that a number is even.
    def even
      Predicate.new(:even, {}, &:even?)
    end

    # Validate, that a number is positive (> 0).
    def positive
      Predicate.new(:positive, {}) { |o| o > 0 }
    end

    # Validate, that a number is not positive (<= 0).
    def not_positive
      Predicate.new(:not_positive, {}) { |o| o <= 0 }
    end

    # Validate that a number is negative (< 0).
    def negative
      Predicate.new(:negative, {}) { |o| o < 0 }
    end

    # Validate that a number is not negative (>= 0).
    def not_negative
      Predicate.new(:not_negative, {}) { |o| o >= 0 }
    end

    extend(self)
  end
end
