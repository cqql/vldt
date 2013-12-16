module Vldt
  # Applies the given validator if the object is not nil.
  class Optional < Validator
    def initialize (validator)
      @validator = validator
    end

    def validate (object)
      if !object.nil?
        errors = @validator.validate(object)

        if errors
          errors
        end
      end
    end
  end
end
