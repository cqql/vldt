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

    def self.less_than_or_equal_to (value)
      Vldt::LessThanOrEqualTo.new(value)
    end

    def self.between (min, max)
      Vldt::Between.new(min, max)
    end

    def self.whole_number
      Vldt::WholeNumber.new
    end

    def self.odd
      Vldt::Odd.new
    end

    def self.even
      Vldt::Even.new
    end

    def self.positive
      Vldt::Positive.new
    end

    def self.not_positive
      Vldt::NotPositive.new
    end

    def self.negative
      Vldt::Negative.new
    end

    def self.not_negative
      Vldt::NotNegative.new
    end
  end
end
