module Vldt
  module DSL
    # Functions for validating lengths of objects (strings, arrays).
    module Length
      def length (value)
        Vldt::Length.new(value)
      end

      def length_greater_than (min)
        Vldt::LengthGreaterThan.new(min)
      end

      def length_less_than (max)
        Vldt::LengthLessThan.new(max)
      end

      def length_between (min, max)
        Vldt::LengthBetween.new(min, max)
      end
    end
  end
end
