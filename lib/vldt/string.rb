module Vldt
  module String
    # Validate that an object is a string.
    def self.string
      Predicate.new(:string, {}) { |o| o.is_a?(::String) }
    end

    # Validates that object matches (`===`) a pattern.
    def self.match (pattern)
      Predicate.new(:match, pattern: pattern) { |o| pattern === o }
    end
  end
end
