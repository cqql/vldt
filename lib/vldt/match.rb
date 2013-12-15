module Vldt
  # Validates that object matches (`===`) a pattern.
  class Match < Predicate
    def initialize (pattern)
      super(:match, pattern: pattern) { |o| pattern === o }
    end
  end
end
