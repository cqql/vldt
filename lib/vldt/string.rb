module Vldt
  module String
    # Validate that an object is a string.
    def self.string
      Predicate.new(:string, {}) { |o| o.is_a?(::String) }
    end

    # Validates that object matches (`===`) a pattern.
    def self.match (pattern)
      Predicate.new(:match, pattern: pattern) { |o| pattern === o }
    end

    # Validate, that a string is of the required length.
    def self.length (value)
      Predicate.new(:length, { value: value}) { |o| o.length == value }
    end

    # Validate that the length of a string is in a given range.
    def self.length_between (min, max)
      Predicate.new(:length_between, { min: min, max: max }) do |o|
        length = o.length

        length >= min && length <= max
      end
    end

    # Validate that the length of a string is greater than a minimum.
    def self.length_greater_than (min)
      Predicate.new(:length_greater_than, { min: min }) { |o| o.length > min }
    end

    # Validate that the length of a string is less than a maximum.
    def self.length_less_than (max)
      Predicate.new(:length_less_than, { max: max }) { |o| o.length < max }
    end
  end
end
