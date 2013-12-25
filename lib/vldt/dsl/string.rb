module Vldt
  module DSL
    # Functions for string validation.
    module String
      def string
        Vldt::String.new
      end

      def match (pattern)
        Vldt::Match.new(pattern)
      end
    end
  end
end
