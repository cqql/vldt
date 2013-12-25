module Vldt
  # Validate that the length of an object is in a given range.
  #
  # This validation does not check the type of the object, so that
  # arrays as well as strings are supported. You have to compose it
  # with a type validation yourself.
  class LengthBetween < Predicate
    def initialize (min, max)
      super(:length_between, { min: min, max: max }) do |o|
        length = o.length

        length >= min && length <= max
      end
    end
  end
end
