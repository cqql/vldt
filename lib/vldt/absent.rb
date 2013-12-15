module Vldt
  # Validates that the object is nil.
  class Absent < Predicate
    def initialize
      super(:absent) { |o| o.nil? }
    end
  end
end
