module Vldt
  # Validate that the length of the array is greater than a minimum.
  #
  # This validation does not check the type of the object, so that
  # arrays as well as strings are supported. You have to compose it
  # with a type validation yourself.
  class LengthGreaterThan < Predicate
    def initialize (value)
      super(:length_greater_than, { value: value }) { |o| o.length > value }
    end
  end
end
