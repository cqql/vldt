module Vldt
  # Validates that the object is nil.
  class Nil < Validator
    def validate (object)
      if !object.nil?
        { [] => [[:nil, {}]] }
      end
    end
  end
end
