module Vldt
  module Array
    # Validate that an object is an array.
    def array
      Predicate.new(:array, {}) { |o| o.is_a?(::Array) }
    end

    # Validate, that an array is of the required length.
    def length (value)
      Predicate.new(:array_length, { value: value}) { |o| o.length == value }
    end

    # Validate that the length of an array is in a given range.
    def length_between (min, max)
      Predicate.new(:array_length_between, { min: min, max: max }) do |o|
        length = o.length

        length >= min && length <= max
      end
    end

    # Validate that the length of an array is greater than a minimum.
    def length_greater_than (min)
      Predicate.new(:array_length_greater_than, { min: min }) { |o| o.length > min }
    end

    # Validate that the length of an array is less than a maximum.
    def length_less_than (max)
      Predicate.new(:array_length_less_than, { max: max }) { |o| o.length < max }
    end

    extend(self)
  end
end
