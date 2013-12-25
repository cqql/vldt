module Vldt
  # Validate that the length of the array is greater than a minimum.
  #
  # This validation does not check the type of the object, so that
  # arrays as well as strings are supported. You have to compose it
  # with a type validation yourself.
  class LengthGreaterThan < Predicate
    def initialize (min)
      super(:length_greater_than, { min: min }) { |o| o.length > min }
    end
  end
end
