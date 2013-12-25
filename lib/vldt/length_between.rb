module Vldt
  class LengthBetween < Chain
    def initialize (min, max)
      super(
        Array.new,
        Predicate.new(:length_between, { min: min, max: max }) do |o|
          length = o.length

          length >= min && length <= max
        end)
    end
  end
end
