module Vldt
  class IsA < Predicate
    def initialize (klass)
      super(:is_a, class: klass) { |o| o.is_a?(klass) }
    end
  end
end
