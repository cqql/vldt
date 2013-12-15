module Vldt
  # Validates that object is not listed on a black list.
  class NoneOf < Predicate
    def initialize (*values)
      super(:none_of, values: values) { |o| values.none? { |v| v == o } }
    end
  end
end
