module Vldt
  class Odd < Chain
    def initialize
      super(
        WholeNumber.new,
        Predicate.new(:odd, {}, &:odd?))
    end
  end
end
