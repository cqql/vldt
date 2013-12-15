module Vldt
  # Validates that object and value are identical (`equal?`).
  class Identical < Predicate
    def initialize (value)
      super(:identical, value: value) { |o| value.equal?(o) }
    end
  end
end
