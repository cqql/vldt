module Vldt
  # Validates that object is included in a list of valid objects.
  class OneOf < Predicate
    def initialize (*values)
      super(:one_of, values: values) { |o| values.any? { |v| v == o } }
    end
  end
end
