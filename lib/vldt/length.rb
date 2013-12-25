module Vldt
  class Length < Chain
    def initialize (value)
      super(
        Array.new,
        Predicate.new(:length, { value: value }) { |o| o.length == value })
    end
  end
end
