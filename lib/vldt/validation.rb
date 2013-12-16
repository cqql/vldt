module Vldt
  # Base class of all validations.
  class Validation
    # Validate object.
    #
    # It should return nil, if object is valid and a hash with the
    # errors otherwise. The hash keys should be selectors of the
    # errorneous objects, while the values should be lists of symbols
    # identifying failed validations and their parameters.
    #
    # A selector in this context is a path through the object
    # hierarchy. For example the path of the number 5 in
    #
    #   v = { array: [1, 3, 5] }
    #
    # would be `[:array, 2]`, because `v.fetch(:array).fetch(2)` is 5.
    #
    # So a validation, that validates, that the object at the position
    # of 5 is larger than 6, should, for example, return
    #
    #   { [:array, 2] => [[:greather_than, { min: 6 }]] }
    def validate (object)

    end
  end
end
