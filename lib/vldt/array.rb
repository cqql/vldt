module Vldt
  # Validate that an object is an array.
  class Array < Predicate
    def initialize
      super(:array, {}) { |o| o.is_a?(::Array) }
    end
  end
end
