module Vldt
  module Array
    # Validate that an object is an array.
    def self.array
      Predicate.new(:array, {}) { |o| o.is_a?(::Array) }
    end
  end
end
