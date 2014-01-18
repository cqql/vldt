module Vldt
  # Apply a validation to an attribute, a value of a hash key or an
  # array element.
  class Validate < Validation
    def initialize (attribute, validation)
      @attribute = attribute
      @validation = validation
      @present = Vldt::Common.present
    end

    def call (object)
      value = object.fetch(@attribute, nil)
      errors = @present.call(value)

      if !errors
        errors = @validation.call(value)
      end

      if errors
        errors.reduce({}) do |e, (k, v)|
          e[[@attribute] + k] = v

          e
        end
      end
    end
  end
end
