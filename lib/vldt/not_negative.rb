module Vldt
  # Validate that a number is not negative (>= 0).
  class NotNegative < Chain
    def initialize
      super(
        Number.new,
        Predicate.new(:not_negative, {}) { |o| o >= 0 })
    end
  end
end
