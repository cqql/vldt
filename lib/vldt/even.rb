module Vldt
  class Even < Chain
    def initialize
      super(
        WholeNumber.new,
        Predicate.new(:even, {}, &:even?))
    end
  end
end
