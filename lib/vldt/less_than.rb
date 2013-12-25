module Vldt
  # Validate that a number is less than a maximum.
  class LessThan < Chain
    def initialize (max)
      super(
        Number.new,
        Predicate.new(:less_than, { max: max }) { |o| o < max })
    end
  end
end
