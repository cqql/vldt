module Vldt
  # Join multiple validations together and merge all of their errors.
  class Join < Validation
    def initialize (*validations)
      @validations = validations
    end

    def call (object)
      errors = @validations.map { |v| v.call(object) }

      if errors.any?
        errors.compact.inject(Hash.new([])) do |es, e|
          e.each do |k, v|
            es[k] += v
          end

          es
        end
      end
    end
  end
end
