module Vldt
  # Validates the equality (`==`) of the object with a value.
  class Equal < Predicate
    def initialize (value)
      super(:equals, value: value) { |o| o == value }
    end
  end
end
