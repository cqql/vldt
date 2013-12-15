module Vldt
  # Validates the equality (`==`) of the object with a value.
  class Equals < Validator
    def initialize (value)
      @value = value
    end

    def validate (object)
      if @value != object
        { [] => [[:equals, { value: @value }]] }
      end
    end
  end
end
