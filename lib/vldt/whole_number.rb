module Vldt
  # Validates that a number is whole.
  class WholeNumber < Chain
    def initialize
      super(
        Number.new,
        Predicate.new(:whole_number, {}) { |o| o.is_a?(Integer) })
    end
  end
end
