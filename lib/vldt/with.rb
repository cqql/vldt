module Vldt
  # Validates the result of a function mapped over the object, instead
  # of the original object.
  #
  # Example
  #
  #   # Validate that a string has 5 characters (yes, this example is
  #   # super artificial)
  #   with = Vldt::With.new(-> s { s.chars }, length(5))
  class With < Validation
    def initialize (block, validation)
      @block = block
      @validation = validation
    end

    def validate (object)

    end
  end
end
