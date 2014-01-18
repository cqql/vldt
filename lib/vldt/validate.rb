module Vldt
  # Apply a validation to an attribute, a value of a hash key or an
  # array element.
  class Validate < Validation
    def initialize (attribute, validation)
      @attribute = attribute
      @validation = validation
      @present = Vldt::Common.present
    end

    def validate (object)
      value = object.fetch(@attribute, nil)
      errors = @present.validate(value)

      if !errors
        errors = @validation.validate(value)
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
