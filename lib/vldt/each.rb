module Vldt
  # Validates each object of an enumerable
  class Each < Validation
    def initialize (validation)
      @validation = validation
      @array_validation = Vldt::Array.array
    end

    def call (object)
      errors = Vldt::Array.array.call(object)

      if errors
        errors
      else
        errors = {}

        object.each_with_index do |v, i|
          e = @validation.call(v)

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
