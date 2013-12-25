module Vldt
  # Validate that the length of an object is less than a maximum.
  #
  # This validation does not check the type of the object, so that
  # arrays as well as strings are supported. You have to compose it
  # with a type validation yourself.
  class LengthLessThan < Predicate
    def initialize (value)
      super(:length_less_than, { value: value }) { |o| o.length < value }
    end
  end
end
