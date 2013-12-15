module Vldt
  # Validates that the object equals (`eql?`) a value.
  class Eqls < Validator
    def initialize (value)
      @value = value
    end

    def validate (object)
      if !@value.eql?(object)
        { [] => [[:eqls, { value: @value}]] }
      end
    end
  end
end
