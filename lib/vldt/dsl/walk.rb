module Vldt
  module DSL
    # Functions for walking structures.
    #
    # This means accessing hash keys or attributes or iterating
    # through arrays.
    module Walk
      def validate (key, validation)
        Vldt::Validate.new(key, validation)
      end

      def each (*validations)
        Vldt::Each.new(*validations)
      end
    end
  end
end
