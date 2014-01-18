module Vldt
  module String
    # Validate that an object is a string.
    def self.string
      Predicate.new(:string, {}) { |o| o.is_a?(::String) }
    end
  end
end
