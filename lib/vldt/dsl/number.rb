module Vldt
  module DSL
    # Function for number validation.
    module Number
      def number
        Vldt::Number.new
      end

      def greater_than (value)
        Vldt::GreaterThan.new(value)
      end

      def greater_than_or_equal_to (value)
        Vldt::GreaterThanOrEqualTo.new(value)
      end

      def less_than (value)
        Vldt::LessThan.new(value)
      end

      def less_than_or_equal_to (value)
        Vldt::LessThanOrEqualTo.new(value)
      end

      def between (min, max)
        Vldt::Between.new(min, max)
      end

      def whole_number
        Vldt::WholeNumber.new
      end

      def odd
        Vldt::Odd.new
      end

      def even
        Vldt::Even.new
      end

      def positive
        Vldt::Positive.new
      end

      def not_positive
        Vldt::NotPositive.new
      end

      def negative
        Vldt::Negative.new
      end

      def not_negative
        Vldt::NotNegative.new
      end
    end
  end
end
