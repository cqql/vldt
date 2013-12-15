module Vldt
  # Validates that object is not listed on a black list.
  class NoneOf
    def initialize (*values)
      @values = values
    end

    def validate (object)
      if @values.any? { |v| v == object }
        { [] => [[:none_of, { values: @values }]] }
      end
    end
  end
end
