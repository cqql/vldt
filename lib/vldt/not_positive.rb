module Vldt
  # Validate that a number is not positive (<= 0).
  class NotPositive < Chain
    def initialize
      super(
        Number.new,
        Predicate.new(:not_positive, {}) { |o| o <= 0 })
    end
  end
end
