module Vldt
  # Validates the result of a function mapped over the object, instead
  # of the original object.
  #
  # The {With} alone does not handle any errors. So you should combine
  # it with other validations like {Common#present} to prevent
  # nil-errors.
  #
  # @example
  #   # Validation to check, if a date string equals a date object
  #   with = Vldt::With.new(-> d { Date.parse(d) }, Vldt::Common.equals(Date.today))
  class With < Validation
    def initialize (block, validation)
      @block = block
      @validation = validation
    end

    def call (object)
      @validation.call(@block.call(object))
    end
  end
end
