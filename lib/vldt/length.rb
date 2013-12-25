module Vldt
  # Validate that an object is of a given length.
  #
  # This validation does not check the type of the object, so that
  # arrays as well as strings are supported. You have to compose it
  # with a type validation yourself.
  class Length < Predicate
    def initialize (value)
      super(:length, { value: value }) { |o| o.length == value }
    end
  end
end
