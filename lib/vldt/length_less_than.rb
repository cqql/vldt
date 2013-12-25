module Vldt
  # Validate that the length of an array is less than a maximum.
  class LengthLessThan < Chain
    def initialize (value)
      super(
        Array.new,
        Predicate.new(:length_less_than, { value: value }) { |o| o.length < value })
    end
  end
end
