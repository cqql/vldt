module Vldt
  class IsA < Validator
    def initialize (klass)
      @klass = klass
    end

    def validate (object)
      if !object.is_a?(@klass)
        { [] => [[:is_a, { class: @klass }]]}
      end
    end
  end
end
