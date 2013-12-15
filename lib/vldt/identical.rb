module Vldt
  # Validates that object and value are identical (`equal?`).
  class Identical < Validator
    def initialize (value)
      @value = value
    end

    def validate (object)
      if !@value.equal?(object)
        { [] => [[:identical, { value: @value }]] }
      end
    end
  end
end
