module Vldt
  # Validates that object is included in a list of valid objects.
  class OneOf
    def initialize (*values)
      @values = values
    end

    def validate (object)
      if !@values.any? { |v| v == object }
        { [] => [[:one_of, { values: @values }]] }
      end
    end
  end
end
