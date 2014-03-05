module Vldt
  # Apply a validation to an attribute, a value of a hash key or an
  # array element.
  class Validate < Validation
    def initialize (attribute, validation)
      @attribute = attribute
      @validation = validation
      @present = Vldt::Common.present
      @is_hash = Vldt::Hash.is_hash
    end

    def call (object)
      errors = @is_hash.call(object)

      if errors
        errors
      else
        value = object.fetch(@attribute, nil)

        errors = @present.call(value)
        errors ||= @validation.call(value)

        if errors
          errors.reduce({}) do |e, (k, v)|
            e[[@attribute] + k] = v

            e
          end
        end
      end
    end
  end
end
