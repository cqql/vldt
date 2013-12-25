module Vldt
  # Validates that object is greater than a minimum.
  class GreaterThan < Chain
    def initialize (min)
      super(
        Number.new,
        Predicate.new(:greater_than, { min: min }) { |o| o > min })
    end
  end
end
