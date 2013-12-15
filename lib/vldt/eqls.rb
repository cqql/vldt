module Vldt
  # Validates that the object equals (`eql?`) a value.
  class Eqls < Predicate
    def initialize (value)
      super(:eqls, value: value) { |o| value.eql?(o) }
    end
  end
end
