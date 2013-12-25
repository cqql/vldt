module Vldt
  module DSL
    # Functions for basic validations like equality testing.
    module Basic
      def absent
        Vldt::Absent.new
      end

      def present
        Vldt::Present.new
      end

      def equal (value)
        Vldt::Equal.new(value)
      end

      def eql (value)
        Vldt::Eql.new(value)
      end

      def identical (value)
        Vldt::Identical.new(value)
      end

      def is_a (klass)
        Vldt::IsA.new(klass)
      end

      def one_of (*collection)
        Vldt::OneOf.new(*collection)
      end

      def none_of (*collection)
        Vldt::NoneOf.new(*collection)
      end
    end
  end
end
