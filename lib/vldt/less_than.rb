module Vldt
  class LessThan < Chain
    def initialize (value)
      super(
        Number.new,
        Predicate.new(:less_than, { value: value }) { |o| o < value })
    end
  end
end
