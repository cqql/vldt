module Vldt
  # Validate that the length of an object is less than a maximum.
  #
  # This validation does not check the type of the object, so that
  # arrays as well as strings are supported. You have to compose it
  # with a type validation yourself.
  class LengthLessThan < Predicate
    def initialize (max)
      super(:length_less_than, { max: max }) { |o| o.length < max }
    end
  end
end
