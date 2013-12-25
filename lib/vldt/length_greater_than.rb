module Vldt
  # Validate that the length of the array is greater than a minimum.
  class LengthGreaterThan < Chain
    def initialize (value)
      super(
        Array.new,
        Predicate.new(:length_greater_than, { value: value }) { |o| o.length > value })
    end
  end
end
