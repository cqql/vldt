module Vldt
  module DSL
    # Functions for composing validations.
    module Composition
      def join (*validations)
        Vldt::Join.new(*validations)
      end

      def chain (*validations)
        Vldt::Chain.new(*validations)
      end

      def optional (validation)
        Vldt::Optional.new(validation)
      end
    end
  end
end
