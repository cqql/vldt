module Vldt
  # Validates that the object is not nil.
  class Present < Predicate
    def initialize
      super(:present) { |o| !o.nil? }
    end
  end
end
