module Vldt
  # Validates that a number is in a given range, boundaries included.
  class Between < Chain
    def initialize (min, max)
      super(
        Number.new,
        Predicate.new(:between, { min: min, max: max }) { |o| o >= min && o <= max })
    end
  end
end
