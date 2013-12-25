module Vldt
  # Validate that an object is a string.
  class String < Predicate
    def initialize
      super(:string, {}) { |o| o.is_a?(::String) }
    end
  end
end
