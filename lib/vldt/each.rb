module Vldt
  # Validates each object of an enumerable
  class Each < Validation
    def initialize (validation)
      @validation = validation
    end

    def validate (object)
      if !object.is_a?(Array)
        { [] => [[:array, {}]] }
      else
        errors = {}

        object.each_with_index do |v, i|
          e = @validation.validate(v)

          if e
            e.map do |selector, error|
              errors[[i] + selector] = error
            end
          end
        end

        if errors.size > 0
          errors
        end
      end
    end
  end
end
