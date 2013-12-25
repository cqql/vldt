module Vldt
  # Validate that a number is negative (< 0).
  class Negative < Chain
    def initialize
      super(
        Number.new,
        Predicate.new(:negative, {}) { |o| o < 0 })
    end
  end
end
