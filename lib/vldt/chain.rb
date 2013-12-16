module Vldt
  # Chain validators together and return the errors of the first one,
  # that fails.
  class Chain < Validator
    def initialize (*validators)
      @validators = validators
    end

    def validate (object)
      @validators.each do |v|
        errors = v.validate(object)

        if errors
          return errors
        end
      end

      nil
    end
  end
end
