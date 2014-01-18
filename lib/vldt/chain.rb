module Vldt
  # Chain validations together and return the errors of the first one,
  # that fails.
  class Chain < Validation
    def initialize (*validations)
      @validations = validations
    end

    def call (object)
      @validations.each do |v|
        errors = v.call(object)

        if errors
          return errors
        end
      end

      nil
    end
  end
end
