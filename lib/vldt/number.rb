module Vldt
  # Function for number validation.
  module Number
    # Validate, that object is a number
    def self.number
      Predicate.new(:number, {}) { |o| o.is_a?(Numeric) }
    end

    def self.greater_than (value)
      Vldt::GreaterThan.new(value)
    end

    def self.greater_than_or_equal_to (value)
      Vldt::GreaterThanOrEqualTo.new(value)
    end

    def self.less_than (value)
      Vldt::LessThan.new(value)
    end

    # Validates that a number is less than or equal to a given one.
    def self.less_than_or_equal_to (value)
      Predicate.new(:less_than_or_equal_to, { value: value }) { |o| o <= value }
    end

    # Validates that a number is in a given range, boundaries included.
    def self.between (min, max)
      Predicate.new(:between, { min: min, max: max }) { |o| o >= min && o <= max }
    end

    # Validate, that object is an integer.
    def self.integer
      Predicate.new(:integer, {}) { |o| o.is_a?(Integer) }
    end

    # Validate, that a number is odd.
    def self.odd
      Predicate.new(:odd, {}, &:odd?)
    end

    # Validate, that a number is even.
    def self.even
      Predicate.new(:even, {}, &:even?)
    end

    # Validate, that a number is positive (> 0).
    def self.positive
      Predicate.new(:positive, {}) { |o| o > 0 }
    end

    # Validate, that a number is not positive (<= 0).
    def self.not_positive
      Predicate.new(:not_positive, {}) { |o| o <= 0 }
    end

    # Validate that a number is negative (< 0).
    def self.negative
      Predicate.new(:negative, {}) { |o| o < 0 }
    end

    # Validate that a number is not negative (>= 0).
    def self.not_negative
      Predicate.new(:not_negative, {}) { |o| o >= 0 }
    end
  end
end
