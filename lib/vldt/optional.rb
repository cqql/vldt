module Vldt
  # Applies the given validation if the object is not nil.
  class Optional < Validation
    def initialize (validation)
      @validation = validation
    end

    def validate (object)
      if !object.nil?
        errors = @validation.validate(object)

        if errors
          errors
        end
      end
    end
  end
end
