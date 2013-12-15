module Vldt
  # Validates that the object is nil.
  class Nil < Predicate
    def initialize
      super(:nil) { |o| o.nil? }
    end
  end
end
