module Vldt
  # Validate that a number is positive (> 0).
  class Positive < Chain
    def initialize
      super(
        Number.new,
        Predicate.new(:positive, {}) { |o| o > 0 })
    end
  end
end
